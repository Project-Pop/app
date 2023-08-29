// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:fluttertoast/fluttertoast.dart';

// Project imports:
import 'package:app/UI/Views/SignUp/widgets/take_name.dart';
import 'package:app/UI/Views/SignUp/widgets/take_profile_image.dart';
import 'package:app/UI/Views/SignUp/widgets/take_username.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    required this.usernameController,
    required this.nameController,
    required this.checkUsernameAvailability,
    required this.formKey,
    required this.signUpUser,
    required this.logOut,
  });

  final TextEditingController usernameController;
  final TextEditingController nameController;
  final Future<bool> Function(String username) checkUsernameAvailability;
  final GlobalKey<FormState> formKey;
  final Function({required DateTime? dob, required File? avatar}) signUpUser;
  final Future Function() logOut;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool usernameAvailable = false;

  File? _avatar;

  final _pageController = PageController();

  int _currentPageIndex = 0;

  List<Widget> _signUpPages = [];

  void _addName() {
    if ((widget.nameController.text?.length ?? 0) > 2) {
      _pageController.jumpToPage(1);
    } else {
      Fluttertoast.showToast(
          msg: 'Please, Enter Your Name, atleast 3 characters');
    }
  }

  void _addUsername({bool available = false}) {
    if (available) {
      _pageController.jumpToPage(2);
    } else {
      Fluttertoast.showToast(msg: 'This username is already choosen');
    }
  }

  void _addAvatar({bool skipped = true, File? avatar}) {
    widget.signUpUser(dob: null, avatar: skipped == false ? avatar : null);
  }

  @override
  void initState() {
    _signUpPages = [
      TakeName(nameController: widget.nameController, addName: _addName),
      TakeUsername(
        usernameController: widget.usernameController,
        checkUsernameAvailability: widget.checkUsernameAvailability,
        addUsername: _addUsername,
      ),
      TakeProfileImage(addAvatar: _addAvatar),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentPageIndex > 0) {
          _pageController.jumpToPage(_currentPageIndex - 1);
          return false;
        }
        return true;
      },
      child: SafeArea(
        child: Form(
          key: widget.formKey,
          child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              _currentPageIndex = index;
            },
            itemBuilder: (context, index) {
              return _signUpPages[index];
            },
          ),
        ),
      ),
    );
  }
}
