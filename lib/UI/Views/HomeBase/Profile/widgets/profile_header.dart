// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app/UI/Views/HomeBase/Profile/widgets/custom_profile_button.dart';
import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';

class HeaderAccountWidget extends StatelessWidget {
  const HeaderAccountWidget(
      {Key key,
      this.postCount,
      this.reactCount,
      this.viewCount,
      this.name,
      this.profileButtonWidget})
      : super(key: key);

  final String postCount;
  final String viewCount;
  final String reactCount;
  final String name;
  final ProfileButtonWidget profileButtonWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(shrinkWrap: true, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 45,
                      backgroundImage: AssetImage(
                        'assets/images/profile.png',
                      ),
                    ),
                    const SizedBox(height: 15),
                    MyText(
                      msg: name,
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 14),
                      maxLines: 1,
                      textScaleFactor: 1.3,
                    ),
                  ],
                ),
                Column(
                  children: [
                    MyText(
                      msg: postCount,
                      textStyle:
                          const TextStyle(fontSize: 14, color: Colors.white),
                      textScaleFactor: 1.3,
                    ),
                    const MyText(
                      msg: 'Posts',
                      textStyle: TextStyle(fontSize: 12, color: Colors.white),
                      maxLines: 1,
                      textScaleFactor: 1.3,
                    ),
                  ],
                ),
                Column(
                  children: [
                    MyText(
                        textScaleFactor: 1.3,
                        msg: viewCount,
                        textStyle:
                            const TextStyle(fontSize: 14, color: Colors.white),
                        maxLines: 1),
                    const MyText(
                      msg: 'Views',
                      textStyle: TextStyle(fontSize: 12, color: Colors.white),
                      maxLines: 1,
                      textScaleFactor: 1.3,
                    ),
                  ],
                ),
                Column(
                  children: [
                    MyText(
                        msg: reactCount,
                        textStyle:
                            const TextStyle(fontSize: 14, color: Colors.white),
                        maxLines: 1),
                    const MyText(
                      msg: 'Reacts',
                      textStyle: TextStyle(fontSize: 12, color: Colors.white),
                      maxLines: 1,
                      textScaleFactor: 1.3,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(14.0), child: profileButtonWidget),
        ],
      ),
    ]));
  }
}
