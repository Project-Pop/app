import 'dart:io';

import 'package:app/ConfigReader/configReader.dart';
import 'package:app/Models/index.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';

import 'Converters/BuiltValueConverter.dart';
import 'Interceptors/AuthInterceptor.dart';

part 'UserApiService.chopper.dart';

@ChopperApi()
abstract class UserApiService extends ChopperService {
  @Get(path: "/")
  Future<Response<UserModel>> getMyProfile();

  @Post(path: "/")
  Future<Response<UserModel>> signUpNewUser(
    @Body() SignUpModel signUpModel,
  );

  @Post(path: "/avatar")
  @Multipart()
  Future<Response> uploadUserAvatar({
    @required @Part() File image,
    @required @Part() File miniImage,
  });

  @Patch(path: "/")
  Future<Response<EditUserModel>> editUserProfile(@Body() EditUserModel edited);

  @Post(path: "/device-token")
  Future<Response> registerDeviceToken(@Query() String deviceToken);

  @Delete(path: "/device-token")
  Future<Response> deleteDeviceToken();

  @Post(path: "/username-availability")
  Future<Response<bool>> isUsernameAvailable(@Query() String username);

  // TODO: sync this api
  // @Get(path:"/search")
  // Future<Response> searchUsers();

  @Get(path: "/activities")
  Future<Response<List<ActivityModel>>> getUserActivityList();

  @Get(path: "/{username}")
  Future<Response<UserModel>> getUserData(@Path() String username);

  @Post(path: "/{username}/follow")
  Future<Response> followUser(@Path() String username);

  @Post(path: "/{username}/unfollow")
  Future<Response> unfollowUser(@Path() String username);

  static UserApiService create() {
    final client = ChopperClient(
      baseUrl: ConfigReader.apiUserServiceUrl,
      services: [
        _$UserApiService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [
        AuthInterceptor(),
        HttpLoggingInterceptor(),
      ],
    );

    return _$UserApiService(client);
  }
}
