import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';
import 'package:app/UI/Views/HomeBase/settings_page/widgets/setting_pages_app_bar.dart';
import 'package:app/UI/Views/models/search_user_model.dart';
import 'package:flutter/material.dart';

class ShowFollowing extends StatelessWidget {
  const ShowFollowing({Key key, this.followingList, this.onTap})
      : super(key: key);
  final List<SearchUser> followingList;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar('Following',context),
      body: ListView.builder(
          itemCount: followingList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 18),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(followingList[index].imgUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          msg: followingList[index].name,
                          textStyle: const TextStyle(color: Colors.white),
                        ),
                        MyText(
                            msg: followingList[index].userNAme,
                            textStyle: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 30,
                      width: 50,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  primary: Colors.white,
                                  side: BorderSide(
                                      color: Colors.white60, width: 1),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(36)))),
                              onPressed: onTap,
                              child: const Text('following'))),
                    ),
                  ))
                ],
              ),
            );
          }),
    );
  }
}
