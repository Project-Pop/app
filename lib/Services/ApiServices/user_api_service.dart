// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:chopper/chopper.dart';

// Project imports:
import 'package:app/Configs/config_reader.dart';
import 'package:app/Models/index.dart';
import 'package:app/Services/ApiServices/Interceptors/connectivity_interceptor.dart';
import 'Converters/built_value_converter.dart';
import 'Interceptors/auth_interceptor.dart';

part 'user_api_service.chopper.dart';

@ChopperApi()
abstract class UserApiService extends ChopperService {
  static final _instance = _initialize();

  static UserApiService get instance => _instance;

  static UserApiService _initialize() {
    final client = ChopperClient(
      baseUrl: ConfigReader.apiUserServiceUrl,
      services: [
        _$UserApiService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [
        ConnectivityInterceptor(),
        AuthInterceptor(),
        HttpLoggingInterceptor(),
      ],
    );

    return _$UserApiService(client);
  }

  @Get(path: '/')
  Future<Response<UserModel>> getMyProfile();

  @Post(path: '/')
  Future<Response<UserModel>> signUpNewUser(
    @Body() SignUpModel signUpModel,
  );

  @Post(path: '/avatar')
  @Multipart()
  Future<Response> uploadUserAvatar({
    @required @Part() File image,
    @required @Part() File miniImage,
  });

  @Patch(path: '/')
  Future<Response<EditUserModel>> editUserProfile(@Body() EditUserModel edited);

  @Post(path: '/device-token')
  Future<Response> registerDeviceToken(@Query() String deviceToken);

  @Delete(path: '/device-token')
  Future<Response> deleteDeviceToken();

  @Post(path: '/username-availability')
  Future<Response<bool>> isUsernameAvailable(@Query() String username);

  // TODO: sync this api
  // @Get(path:"/search")
  // Future<Response> searchUsers();

  @Get(path: '/activities')
  Future<Response<List<ActivityModel>>> getUserActivityList();

  @Get(path: '/{username}')
  Future<Response<UserModel>> getUserData(@Path() String username);

  @Post(path: '/{username}/follow')
  Future<Response> followUser(@Path() String username);

  @Post(path: '/{username}/unfollow')
  Future<Response> unfollowUser(@Path() String username);
}
