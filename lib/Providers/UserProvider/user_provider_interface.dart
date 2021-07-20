import 'dart:io';

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

  // Future getUserDataByUsername(String username);

  // Future followUser(String remoteUsername);
  // Future unfollowUser(String remoteUsername);

}
