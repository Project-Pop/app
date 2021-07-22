// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:fluttertoast/fluttertoast.dart';

// Project imports:
import 'package:app/Configs/custom_logger.dart';
import 'package:app/Models/index.dart';
import 'package:app/Providers/UserProvider/user_provider_interface.dart';
import 'package:app/Services/ApiServices/index.dart';

class UserProvider with ChangeNotifier implements UserProviderInterface {
  UserProvider({@required this.context}) {
    initiate();
  }

  bool _loaded = false;

  final BuildContext context;
  final UserApiService _userApiService = UserApiService.instance;

  UserModel _userModel;

  final _logger = CustomLogger.logger(UserProvider);

  @override
  Future<void> initiate() async {
    final res = await _userApiService.getMyProfile();

    if (res.isSuccessful) {
      _userModel = res.body;
    } else if (res.statusCode == 404) {
      // this user's data doesn't exist in database
      // sign up the user.
      Fluttertoast.showToast(msg: "Hi, Let's build your profile.");
    } else {
      Fluttertoast.showToast(msg: 'Unknown error occured');
    }
    _loaded = true;
    notifyListeners();
  }

  @override
  Future<void> signUpNewUser(SignUpModel signUpModel, File avatar) async {
    final res = await _userApiService.signUpNewUser(signUpModel);
    if (res.isSuccessful) {
      _userModel = res.body;
      Fluttertoast.showToast(msg: 'Profile created successfully 🤗');

      // TODO: upload image in background
      // Fluttertoast.showToast(msg: "Uploading avatar in background");

      notifyListeners();
    } else {
      Fluttertoast.showToast(msg: 'Error in creating profile');
    }
  }

  @override
  Future<bool> isUsernameAvailable(String username) async {
    final res = await _userApiService.isUsernameAvailable(username);
    if (res.isSuccessful) {
      return res.body;
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong when checking username availability');
    }
    return false;
  }

  @override
  Future<UserModel> getUserDataByUsername(String username) async {
    final res = await _userApiService.getUserData(username);

    if (res.isSuccessful) {
      return res.body;
    } else {
      _logger.w('unable to fetch user data of $username,'
          ' code:${res.statusCode}, error: ${res.error}');
      return null;
    }
  }

  @override
  Future<bool> followUser(String remoteUsername) async {
    assert(remoteUsername != user?.username, 'user can not follow himself');

    final res = await _userApiService.followUser(remoteUsername);
    if (res.isSuccessful) {
      return true;
    } else {
      _logger.e('error in following user'
          ' code:${res.statusCode}, error: ${res.error}');
      return false;
    }
  }

  @override
  Future<bool> unfollowUser(String remoteUsername) async {
    assert(remoteUsername != user?.username, 'user can not unfollow himself');

    final res = await _userApiService.unfollowUser(remoteUsername);
    if (res.isSuccessful) {
      return true;
    } else {
      _logger.e('error in unfollowing user'
          ' code:${res.statusCode}, error: ${res.error}');
      return false;
    }
  }

  @override
  Future<List<MinimalUserModel>> searchUsers(String searchString) async {
    final res = await _userApiService.searchUsers(searchString);
    if (res.isSuccessful) {
      return res.body;
    } else {
      _logger.e('error in searching for users '
          'code:${res.statusCode}, error:${res.error}');
      return [];
    }
  }

  // ---------------------getters---------------

  bool get loaded => _loaded;
  UserModel get user => _userModel;
}
