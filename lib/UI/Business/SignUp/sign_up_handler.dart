// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:app/Models/index.dart';
import 'package:app/Providers/index.dart';
import 'package:app/UI/Views/SignUp/sign_up_page.dart';

class SignUpHandler extends StatefulWidget {
  @override
  _SignUpHandlerState createState() => _SignUpHandlerState();
}

class _SignUpHandlerState extends State<SignUpHandler> {
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  UserProvider? _userProvider;
  AuthProvider? _authProvider;

  Future<bool> _checkUsernameAvailability(String username) {
    return (_userProvider?.isUsernameAvailable(username))!;
  }

  Future<void> _signUpUser({required DateTime dob, File? avatar}) async {
    if (_formKey.currentState?.validate() != true) return;

    // TODO: validate all the controllers.

    if (await _checkUsernameAvailability(_usernameController.text) == false) {
      Fluttertoast.showToast(msg: 'This username is not available');
      return;
    }

    final newUser = SignUpModel((b) => b
      ..username = _usernameController.text
      ..fullname = _nameController.text
      ..dob = dob);

    await _userProvider?.signUpNewUser(newUser, avatar);
  }

  Future<void> _logout() async {
    await _authProvider?.logOut(context);
  }

  @override
  void initState() {
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _authProvider = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SignUpPage(
      usernameController: _usernameController,
      nameController: _nameController,
      checkUsernameAvailability: _checkUsernameAvailability,
      formKey: _formKey,
      signUpUser: _signUpUser,
      logOut: _logout,
    );
  }
}
