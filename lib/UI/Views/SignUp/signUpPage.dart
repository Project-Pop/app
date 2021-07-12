import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final Future<bool> Function(String username) checkUsernameAvailability;
  final GlobalKey<FormState> formKey;
  final Function({@required DateTime dob, @required File avatar}) signUpUser;
  final Future Function() logOut;

  SignUpPage({
    @required this.usernameController,
    @required this.nameController,
    @required this.emailController,
    @required this.checkUsernameAvailability,
    @required this.formKey,
    @required this.signUpUser,
    @required this.logOut,
  });

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool usernameAvailable = false;

  DateTime _selectedDate;
  File _avatar;

  _selectDate() async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(1940),
        lastDate: DateTime(2030),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
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

  getImage() async {
    final picker = ImagePicker();

    final selectedImage = await picker.getImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      final croppedImage = await ImageCropper.cropImage(
          cropStyle: CropStyle.circle,
          sourcePath: selectedImage.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 50,
          maxHeight: 400,
          maxWidth: 400,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
              statusBarColor: Colors.redAccent,
              cropFrameColor: Colors.grey[600],
              backgroundColor: Colors.white,
              toolbarColor: Colors.white));
      setState(() {
        if (croppedImage != null) {
          _avatar = File(croppedImage.path);
        } else {
          print("Picture not selected.");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: widget.formKey,
          child: ListView(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, size.height / 50, 0, 0),
                  child: GestureDetector(
                    onTap: getImage,
                    behavior: HitTestBehavior.deferToChild,
                    child: CircleAvatar(
                      radius: size.width / 5,
                      backgroundColor: Colors.white24,
                      child: CircleAvatar(
                        radius: size.width / 5.3,
                        backgroundImage:
                            _avatar == null ? null : FileImage(_avatar),
                        backgroundColor: Colors.black45,
                        child: _avatar == null
                            ? Icon(
                                Icons.add_a_photo,
                                size: size.width / 15,
                                color: Colors.green,
                              )
                            : Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    _avatar = null;
                                    setState(() {});
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: Icon(
                                      Icons.cancel,
                                      color: Colors.redAccent,
                                      size: size.width / 15,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 16.0),
                child: Column(children: [
                  TextFormField(
                    controller: widget.nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'NAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400]),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                    validator: (val) {
                      if (val.isEmpty) return 'Please fill this field';
                      if (val.length < 3) return 'Minimum length should be 3';

                      return null;
                    },
                  ),
                  SizedBox(height: size.height / 50),
                  Column(children: [
                    TextFormField(
                      controller: widget.usernameController,
                      style: TextStyle(color: Colors.white),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9_]')),
                      ],
                      decoration: InputDecoration(
                          labelText: 'USER NAME ',
                          labelStyle: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400]),
                          helperText: widget.usernameController.text.length >= 3
                              ? usernameAvailable
                                  ? "Username is available"
                                  : "Username is not available"
                              : "Allowed Characters: a-z 0-9 _ (Min length: 3)",
                          helperStyle: !usernameAvailable ||
                                  widget.usernameController.text.length < 3
                              ? TextStyle(fontFamily: "Lato", color: Colors.red)
                              : TextStyle(
                                  fontFamily: "Lato", color: Colors.green),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  widget.usernameController.text.length > 3
                                      ? usernameAvailable
                                          ? BorderSide(color: Colors.green)
                                          : BorderSide(color: Colors.redAccent)
                                      : BorderSide(color: Colors.redAccent))),
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.done,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      maxLength: 25,
                      onChanged: (val) async {
                        if (val.isEmpty || val.length < 3) {
                          usernameAvailable = false;
                          return;
                        }
                        val = val.toLowerCase();

                        usernameAvailable =
                            await widget.checkUsernameAvailability(val);
                        setState(() {});
                      },
                      validator: (val) {
                        if (val.isEmpty) return 'Please fill this field';
                        if (val.length < 3) return 'Minimum length should be 3';

                        return null;
                      },
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        usernameAvailable == true
                            ? 'This username can not be changed later'
                            : '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(height: size.height / 50),
                  TextFormField(
                    controller: widget.emailController,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        hintText: "Your email address",
                        hintStyle: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w200,
                            color: Colors.grey[400]),
                        labelStyle: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400]),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectDate();
                    },
                    child: TextFormField(
                      controller: _selectedDate == null
                          ? null
                          : TextEditingController(
                              text: DateFormat.yMMMMd('en_US')
                                  .format(_selectedDate)),
                      style: TextStyle(color: Colors.white),
                      enabled: false,
                      decoration: InputDecoration(
                          labelText: 'DOB',
                          hintText: "",
                          hintStyle: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w200,
                              color: Colors.grey[400]),
                          labelStyle: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400]),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red))),
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () => widget.signUpUser(
                  dob: _selectedDate,
                  avatar: _avatar,
                ),
                child: Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 4.0,
                      child: Center(
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato'),
                        ),
                      ),
                    )),
              ),
              SizedBox(height: 32),
              InkWell(
                onTap: () async {
                  // TODO:
                  //Progress Indicator here
                  await widget.logOut();
                },
                child: Container(
                    height: size.height / 20,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Colors.white,
                      elevation: 7.0,
                      child: Center(
                        child: Text(
                          'LOG OUT',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato'),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
