import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';
import 'package:app/UI/Views/HomeBase/settings_page/widgets/setting_pages_app_bar.dart';
import 'package:app/UI/Views/models/search_user_model.dart';
import 'package:flutter/material.dart';

class ShowFollowers extends StatelessWidget {
  const ShowFollowers({Key key, this.followersList}) : super(key: key);

  final List<SearchUser> followersList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar('Followers',context),
      body: ListView.builder(
          itemCount: followersList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 18),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(followersList[index].imgUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          msg: followersList[index].name,
                          textStyle: const TextStyle(color: Colors.white),
                        ),
                        MyText(
                            msg: followersList[index].userNAme,
                            textStyle: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
