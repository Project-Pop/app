// Flutter imports:
import 'dart:io';

import 'package:app/UI/Views/HomeBase/Widgets/custom_image_provider.dart';
import 'package:app/UI/Views/HomeBase/search_page/widgets/grid_post_details_page.dart';
import 'package:app/UI/Views/HomeBase/search_page/widgets/grid_vew_shimmer.dart';

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Project imports:
import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';

import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:path_provider/path_provider.dart';

String gridUrl =
    'https://images.all-free-download.com/footage_preview/webm/horse_riding_205.webm';

//class for profile page pops
class CardPop extends StatefulWidget {
  const CardPop({Key key, this.vidUrl}) : super(key: key);

  final String vidUrl;

  @override
  _CardPopState createState() => _CardPopState();
}

class _CardPopState extends State<CardPop> {
  String outputPath;
  String dirPath;
  Future<void> createPath() async {
    await convertGif();
  }

  @override
  void initState() {
    createPath();

    super.initState();
  }

  @override
  void dispose() {
    final dir = Directory(dirPath);
    dir.deleteSync(recursive: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return outputPath != null
        ? SizedBox(
            child: CustomImageProvider(
            imgUrl: outputPath,
          ))
        : const GridViewShimmer();
  }

  Future<void> convertGif() async {
    String timestamp() => DateTime.now().microsecondsSinceEpoch.toString();
    final Directory extDir = await getTemporaryDirectory();
    dirPath = '${extDir.path}/video';
    await Directory(dirPath).create(recursive: true);
    final String rawDocumentPath = dirPath;

    outputPath = '$rawDocumentPath/output${timestamp()}.gif';

    final FlutterFFmpeg _flutterFFmpeg = FlutterFFmpeg();
    final arguments = ['-i', gridUrl, outputPath];
    _flutterFFmpeg.executeWithArguments(arguments).then((rc) {
      setState(() {});
    });
  }
}

// class for grid view search page

Widget addPhotoWidget() {
  return Container(
    height: 100,
    color: Colors.green[900],
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.add_a_photo, color: Colors.white, size: 25),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: MyText(
              msg: 'Add Photo',
              maxLines: 1,
              textScaleFactor: 1.3,
              textStyle: TextStyle(fontSize: 15, color: Colors.white)),
        )
      ],
    )),
  );
}

//class for pop tag
class DyamicGridView extends StatelessWidget {
  const DyamicGridView({Key key, this.popList, this.isMinePop})
      : super(key: key);
  final List popList;
  final bool isMinePop;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.49,
      child: StaggeredGridView.countBuilder(
        physics: const NeverScrollableScrollPhysics(),
        //shrinkWrap: true,
        crossAxisCount: 3,
        itemCount: isMinePop ? popList.length + 1 : popList.length,
        itemBuilder: (BuildContext context, int index) {
          return isMinePop == false && index == 0
              ? addPhotoWidget()
              : const CardPop();
        },
        staggeredTileBuilder: (int index) => const StaggeredTile.count(1, 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
