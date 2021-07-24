// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';
import 'package:app/UI/Views/SignUp/take_username.dart';
import 'package:app/UI/Views/SignUp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
// Package imports:
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    @required this.usernameController,
    @required this.nameController,
    @required this.emailController,
    @required this.checkUsernameAvailability,
    @required this.formKey,
    @required this.signUpUser,
    @required this.logOut,
  });

  final TextEditingController usernameController;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final Future<bool> Function(String username) checkUsernameAvailability;
  final GlobalKey<FormState> formKey;
  final Function({@required DateTime dob, @required File avatar}) signUpUser;
  final Future Function() logOut;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool usernameAvailable = false;

  DateTime _selectedDate;
  File _avatar;

  Future<void> _selectDate() async {
    final DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(1940),
        lastDate: DateTime(2030),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Colors.green,
                onPrimary: Colors.white,
                surface: Colors.black,
                onSurface: Colors.yellow,
              ),
              dialogBackgroundColor: Colors.black.withOpacity(0.8),
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      setState(() {});
    }
  }

  void checkFields() {
    if (widget.nameController.text != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return UserName(
          usernameController: widget.usernameController,
          checkUsernameAvailability: widget.checkUsernameAvailability,
        );
      }));
    } else {
      Fluttertoast.showToast(msg: 'Please, Enter Your Name');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: widget.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeadingText(
                textAlign: TextAlign.center,
                msg: 'Whats Your Name!!',
                textStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          autofocus: true,
                          textAlign: TextAlign.center,
                          controller: widget.nameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                          ),
                          validator: (val) {
                            if (val.isEmpty) return 'Please fill this field';
                            if (val.length < 3) {
                              return 'Minimum length should be 3';
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: size.height / 50),
                      /*GestureDetector(
                      onTap: () {
                        _selectDate();
                      },
                      child: TextFormField(
                        controller: _selectedDate == null
                            ? null
                            : TextEditingController(
                                text: DateFormat.yMMMMd('en_US')
                                    .format(_selectedDate)),
                        style: const TextStyle(color: Colors.white),
                        enabled: false,
                        decoration: InputDecoration(
                            labelText: 'DOB',
                            hintText: '',
                            hintStyle: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w200,
                                color: Colors.grey[400]),
                            labelStyle: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400]),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red))),
                      ),
                    ),*/
                    ]),
              ),
              const SizedBox(height: 50),
              CustomButtons(
                icon: const Icon(
                  FlutterIcons.arrow_alt_circle_right_faw5,
                  size: 60,
                ),
                onTap: () {
                  checkFields();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*onTap: () => widget.signUpUser(
                  dob: _selectedDate,
                  avatar: _avatar,
                ),*/
