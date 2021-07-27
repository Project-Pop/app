import 'dart:io';

import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class TakeProfileImage extends StatefulWidget {
  const TakeProfileImage({Key key, @required this.addAvatar}) : super(key: key);

  final Function({bool skipped, File avatar}) addAvatar;

  @override
  _TakeProfileImageState createState() => _TakeProfileImageState();
}

class _TakeProfileImageState extends State<TakeProfileImage> {
  File _avatar;
  Future<void> _getImage() async {
    final picker = ImagePicker();

    final selectedImage = await picker.getImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      final croppedImage = await ImageCropper.cropImage(
          cropStyle: CropStyle.circle,
          sourcePath: selectedImage.path,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
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
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent, actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  widget.addAvatar(skipped: true, avatar: null);
                },
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: MyText(
                    msg: 'Skip',
                    textStyle: TextStyle(color: Colors.green, fontSize: 14),
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.6),
              InkWell(
                onTap: () {
                  if (_avatar == null) {
                    Fluttertoast.showToast(
                        msg: 'please Select Your Profile Image');
                  } else {
                    widget.addAvatar(skipped: false, avatar: _avatar);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: MyText(
                    msg: 'Done',
                    textStyle: TextStyle(color: Colors.green, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ]),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: const HeadingText(
                        msg: 'Lets,Select Your Profile Photo',
                        textAlign: TextAlign.center,
                        textStyle:
                            TextStyle(color: Colors.green, fontSize: 26)),
                  ),
                  SizedBox(height: size.height / 50),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, size.height / 50, 0, 0),
                    child: GestureDetector(
                      onTap: _getImage,
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
                  SizedBox(height: size.height / 50),
                ],
              ),
            ),
          ]),
        ));
  }
}
