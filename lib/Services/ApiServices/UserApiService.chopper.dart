// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$UserApiService extends UserApiService {
  _$UserApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = UserApiService;

  @override
  Future<Response<dynamic>> signUpNewUser(SignUpModel signUpModel) {
    final $url = 'v1/users/';
    final $body = signUpModel;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> uploadUserAvatar({File image, File miniImage}) {
    final $url = 'v1/users/avatar';
    final $parts = <PartValue>[
      PartValue<File>('image', image),
      PartValue<File>('miniImage', miniImage)
    ];
    final $request =
        Request('POST', $url, client.baseUrl, parts: $parts, multipart: true);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<EditUserModel>> editUserProfile(EditUserModel edited) {
    final $url = 'v1/users/';
    final $body = edited;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<EditUserModel, EditUserModel>($request);
  }

  @override
  Future<Response<dynamic>> registerDeviceToken(String deviceToken) {
    final $url = 'v1/users/device-token';
    final $params = <String, dynamic>{'deviceToken': deviceToken};
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteDeviceToken() {
    final $url = 'v1/users/device-token';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<bool>> isUsernameAvailable(String username) {
    final $url = 'v1/users/username-availability';
    final $params = <String, dynamic>{'username': username};
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<bool, bool>($request);
  }

  @override
  Future<Response<List<ActivityModel>>> getUserActivityList() {
    final $url = 'v1/users/activities';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ActivityModel>, ActivityModel>($request);
  }

  @override
  Future<Response<UserModel>> getUserData(String username) {
    final $url = 'v1/users/$username';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<UserModel, UserModel>($request);
  }

  @override
  Future<Response<dynamic>> followUser(String username) {
    final $url = 'v1/users/$username/follow';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> unfollowUser(String username) {
    final $url = 'v1/users/$username/unfollow';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
