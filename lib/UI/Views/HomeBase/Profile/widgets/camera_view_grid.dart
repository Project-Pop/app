// Flutter imports:
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

// Package imports:
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Project imports:
import 'package:app/UI/Views/HomeBase/Profile/widgets/pop_view_grid_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class DyamicGridViewForCameraPops extends StatefulWidget {
  const DyamicGridViewForCameraPops({Key key, this.popList, this.isMinePop})
      : super(key: key);
  final List popList;
  final bool isMinePop;

  @override
  _DyamicGridViewForCameraPopsState createState() =>
      _DyamicGridViewForCameraPopsState();
}

class _DyamicGridViewForCameraPopsState
    extends State<DyamicGridViewForCameraPops> {
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
      height: MediaQuery.of(context).size.height * 0.45,
      child: StaggeredGridView.countBuilder(
        // shrinkWrap: true,
        crossAxisCount: 3,
        itemCount: widget.isMinePop
            ? widget.popList.length + 1
            : widget.popList.length,
        itemBuilder: (BuildContext context, int index) {
          return widget.isMinePop == true && index == 0
              ? addPhotoWidget()
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
