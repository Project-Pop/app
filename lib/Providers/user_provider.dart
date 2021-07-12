// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:fluttertoast/fluttertoast.dart';

// Project imports:
import 'package:app/Models/index.dart';
import 'package:app/Services/ApiServices/index.dart';

class UserProvider with ChangeNotifier {
  UserProvider({@required this.context}) {
    initiate();
  }

  bool _loaded = false;

  final BuildContext context;
  final UserApiService _userApiService = UserApiService.instance;

  UserModel _userModel;

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

  bool get loaded => _loaded;
  UserModel get user => _userModel;
}