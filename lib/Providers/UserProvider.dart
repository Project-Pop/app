import 'dart:io';

import 'package:app/Models/index.dart';
import 'package:app/Services/ApiServices/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class UserProvider with ChangeNotifier {
  bool _loaded = false;

  final BuildContext context;
  final UserApiService _userApiService;

  UserModel _userModel;

  UserProvider({@required this.context})
      : _userApiService = Provider.of<UserApiService>(context, listen: false) {
    initiate();
  }

  Future<void> initiate() async {
    var res = await _userApiService.getMyProfile();

    if (res.isSuccessful) {
      _userModel = res.body;
    } else if (res.statusCode == 404) {
      // this user's data doesn't exist in database
      // sign up the user.
      Fluttertoast.showToast(msg: "Hi, Let's build your profile.");
    } else {
      Fluttertoast.showToast(msg: "Unknown error occured");
    }
    _loaded = true;
    notifyListeners();
  }

  Future<void> signUpNewUser(SignUpModel signUpModel, File avatar) async {
    final res = await _userApiService.signUpNewUser(signUpModel);
    if (res.isSuccessful) {
      _userModel = res.body;
      Fluttertoast.showToast(msg: "Profile created successfully 🤗");

      // TODO: upload image in background
      // Fluttertoast.showToast(msg: "Uploading avatar in background");

      notifyListeners();
    } else {
      Fluttertoast.showToast(msg: "Error in creating profile");
    }
  }

  Future<bool> isUsernameAvailable(String username) async {
    final res = await _userApiService.isUsernameAvailable(username);
    if (res.isSuccessful)
      return res.body;
    else
      Fluttertoast.showToast(
          msg: "Something went wrong when checking username availability");
    return false;
  }

  bool get loaded => _loaded;
  UserModel get user => _userModel;
}
