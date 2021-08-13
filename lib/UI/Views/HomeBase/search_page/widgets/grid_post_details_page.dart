import 'package:app/UI/Views/HomeBase/Widgets/custom_image_provider.dart';
import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';
import 'package:app/UI/Views/HomeBase/Widgets/custom_video_player.dart';
import 'package:app/UI/Views/HomeBase/Widgets/setting_pages_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class GridPostDetails extends StatelessWidget {
  const GridPostDetails({Key key, this.vidUrl, this.userName})
      : super(key: key);
  final String vidUrl;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Posts', context),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/profile.png',
                  ),
                  radius: 17,
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // alignment: Alignment.topLeft,
                      const MyText(
                        msg: 'Xyz@123',
                        textStyle:
                            TextStyle(fontSize: 13.5, color: Colors.white),
                      ),

                      const Text(
                        'Popped by cena@123',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.topRight,
                  child: MyText(
                    msg: '19h',
                    textStyle: TextStyle(fontSize: 13.5, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 400,
              width: double.infinity,
              child: CustomVideoPlayer(
                videoUrl: vidUrl,
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(FlutterIcons.heart_outline_mco,
                        color: Colors.white, size: 22)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.emoji_emotions,
                        color: Colors.white, size: 22)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FlutterIcons.turned_in_mdi,
                      color: Colors.white,
                      size: 22,
                    )),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(FlutterIcons.more_horiz_mdi,
                              color: Colors.white, size: 22),
                        )))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(FlutterIcons.heart_ant,
                        color: Colors.red, size: 17)),
                const MyText(
                  msg: '19',
                  textStyle: TextStyle(fontSize: 12, color: Colors.white),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(FlutterIcons.fire_alt_faw5s,
                        color: Colors.yellow, size: 17)),
                const MyText(
                  msg: '19',
                  textStyle: TextStyle(fontSize: 12, color: Colors.white),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FlutterIcons.smile_beam_faw5,
                      color: Colors.green,
                      size: 17,
                    )),
                const MyText(
                  msg: '19',
                  textStyle: TextStyle(fontSize: 12, color: Colors.white),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.thumb_up, color: Colors.blue, size: 17),
                ),
                const MyText(
                  msg: '19',
                  textStyle: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
