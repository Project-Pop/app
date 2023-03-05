// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';
import 'package:app/UI/Views/HomeBase/Widgets/setting_pages_app_bar.dart';
import 'package:app/UI/Views/HomeBase/settings_page/show_followers_page.dart';
import 'package:app/UI/Views/HomeBase/settings_page/show_following_page.dart';
import 'package:app/UI/Views/HomeBase/settings_page/widgets/setting_items.dart';
import 'package:app/UI/Views/models/search_user_model.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage(
      {Key key,
      this.followList,
      this.followingList,
      required this.name,
      required this.userAvatar,
      required this.userNmae,
      this.onTap})
      : super(key: key);
  final Image userAvatar;
  final List followingList;
  final List followList;
  final String userNmae;
  final String name;
  final Function() onTap;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
        appBar: customAppBar('Settings', context),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _getImage,
                        behavior: HitTestBehavior.deferToChild,
                        child: CircleAvatar(
                          radius: size.width / 8,
                          backgroundColor: Colors.white24,
                          child: CircleAvatar(
                              radius: size.width / 5,
                              backgroundImage:
                                  const AssetImage('assets/images/profile.png'),
                              backgroundColor: Colors.black45,
                              child: Icon(
                                Icons.add_a_photo,
                                size: size.width / 15,
                                color: Colors.green,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MyText(
                                  msg: 'Name',
                                  textStyle: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 25,
                                    child: TextField(
                                        decoration: InputDecoration(
                                      labelText: widget.name,
                                      labelStyle: const TextStyle(
                                          color: Colors.white60),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green),
                                      ),
                                    )),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MyText(
                                  msg: 'Username',
                                  textStyle: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                MyText(
                                    msg: widget.userNmae,
                                    textStyle: const TextStyle(
                                        color: Colors.white60, fontSize: 15))
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SettingItem(
                        itemName: 'Following',
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return ShowFollowing(
                              onTap: () {},
                              followingList: [
                                const SearchUser(
                                    imgUrl: 'assets/images/profile.png',
                                    name: 'xyz',
                                    username: 'xuz@gamil'),
                                const SearchUser(
                                    imgUrl: 'assets/images/profile.png',
                                    name: 'xyz',
                                    username: 'xuz@gamil')
                              ],
                            );
                          }));
                        },
                        icon: const Icon(FlutterIcons.user_following_sli),
                      ),
                      SettingItem(
                        itemName: 'Followers',
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return const ShowFollowers(
                              followersList: [
                                SearchUser(
                                    imgUrl: 'assets/images/profile.png',
                                    name: 'xyz',
                                    username: 'xuz@gamil'),
                                SearchUser(
                                    imgUrl: 'assets/images/profile.png',
                                    name: 'xyz',
                                    username: 'xuz@gamil')
                              ],
                            );
                          }));
                        },
                        icon: const Icon(FlutterIcons.user_follow_sli),
                      ),
                      SettingItem(
                        itemName: 'Get Help',
                        onTap: () {},
                        icon: const Icon(FlutterIcons.help_box_mco),
                      ),
                      SettingItem(
                          itemName: 'FAQ',
                          onTap: () {},
                          icon: const Icon(FlutterIcons.question_ant)),
                      SettingItem(
                        itemName: 'Rate Us',
                        onTap: () {},
                        icon: const Icon(FlutterIcons.heart_outlined_ent),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
