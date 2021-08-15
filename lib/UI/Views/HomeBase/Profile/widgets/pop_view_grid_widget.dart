// Flutter imports:
import 'dart:io';

import 'package:app/UI/Views/HomeBase/Widgets/custom_image_provider.dart';
import 'package:app/UI/Views/HomeBase/Widgets/grid_post_details_page.dart';

import 'package:app/UI/Views/HomeBase/search_page/widgets/grid_vew_shimmer.dart';

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Project imports:
import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';

import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

//class for profile page pops
class CardPop extends StatelessWidget {
  const CardPop({Key key, this.vidUrl, this.gifUrl}) : super(key: key);

  final String vidUrl;
  final String gifUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return GridPostDetails(
            vidUrl: vidUrl,
          );
        }));
      },
      child: SizedBox(
          child: CustomImageProvider(
        imgUrl: gifUrl,
      )),
    );
  }
}

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
class DyamicGridView extends StatefulWidget {
  const DyamicGridView({Key key, this.popList, this.isMinePop, this.isHome})
      : super(key: key);
  final List<String> popList;
  final bool isMinePop;
  final bool isHome;

  @override
  _DyamicGridViewState createState() => _DyamicGridViewState();
}

class _DyamicGridViewState extends State<DyamicGridView> {
  String dirPath;
  List<String> storedConvertedGifs = [];
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    convertGif();
  }

  Future<void> convertGif() async {
    var uuid = Uuid();
    String timestamp() =>
        DateTime.now().millisecondsSinceEpoch.toString() + uuid.v4().toString();
    final Directory extDir = await getTemporaryDirectory();
    dirPath = extDir.path;

    final String rawDocumentPath = dirPath;

    for (var i = 0; i < widget.popList.length; i++) {
      final String outputPath = '$rawDocumentPath/output${timestamp()}.gif';
      final FlutterFFmpeg _flutterFFmpeg = FlutterFFmpeg();
      final arguments = ['-i', widget.popList[i], outputPath];
      await _flutterFFmpeg.executeWithArguments(arguments).whenComplete(() {
        print('done');

        setState(() {});
      });

      storedConvertedGifs.add(outputPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.49,
      child: StaggeredGridView.countBuilder(
        physics: const NeverScrollableScrollPhysics(),
        //shrinkWrap: true,
        crossAxisCount: 3,
        itemCount: widget.isHome
            ? widget.popList.length
            : widget.isMinePop
                ? widget.popList.length + 1
                : widget.popList.length,
        itemBuilder: (BuildContext context, int index) {
          return widget.isMinePop == false && index == 0
              ? addPhotoWidget()
              : storedConvertedGifs.length != widget.popList.length
                  ? const GridViewShimmer()
                  : CardPop(
                      gifUrl: storedConvertedGifs[index],
                      vidUrl: widget.popList[index]);
        },
        staggeredTileBuilder: (int index) => const StaggeredTile.count(1, 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
