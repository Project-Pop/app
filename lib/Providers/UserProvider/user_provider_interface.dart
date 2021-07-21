// Dart imports:
import 'dart:io';

// Project imports:
import 'package:app/Models/index.dart';

abstract class UserProviderInterface {
  Future<void> initiate();

  Future signUpNewUser(SignUpModel signUpModel, File avatar);

  // Future uploadUserAvatar(File avatar);

  // Future editUser();

  // Future registerDeviceToken();
  // Future deleteDeviceToken();

  Future<bool> isUsernameAvailable(String username);

  // Future getUserActivities();

  Future<UserModel> getUserDataByUsername(String username);

  Future<bool> followUser(String remoteUsername);
  Future<bool> unfollowUser(String remoteUsername);

  Future<List<MinimalUserModel>> searchUsers(String searchString);
}
