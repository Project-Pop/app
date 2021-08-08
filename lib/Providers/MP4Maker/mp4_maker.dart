import 'dart:async';
import 'dart:io';

import 'package:app/Configs/custom_logger.dart';
import 'package:app/Providers/MP4Maker/image_scaler.dart';
import 'package:app/Providers/MP4Maker/video_generator.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class MP4Maker {
  MP4Maker({
    @required this.inputImages,
    this.onThumbnailReady,
  })  : _tempFolder = DateTime.now().millisecondsSinceEpoch.toString(),
        assert(inputImages != null && inputImages.isNotEmpty,
            'input image list can not be empty or null') {
    _init();
  }

  final List<File> inputImages;
  final Function(String) onThumbnailReady;

  final String _tempFolder;
  final List<File> _tempDirectoryImages = [];
  final _extension = 'tmp';
  final Logger _logger = CustomLogger.logger(MP4Maker);

  Directory _directory;
  String _dirPath;

  final _completer = Completer<void>();

  Future<void> _init() async {
    // creating new folder to host images and videos
    await _initializeNewDirectory();

    // writing images to newly created folder
    await _writeImagesInSequence();

    // generate the required videos
    await _initVideoGenerator();

    _completer.complete();
  }

  Future<void> _initializeNewDirectory() async {
    _directory = await getExternalStorageDirectory();

    _dirPath = '${_directory.path}/$_tempFolder';
    await Directory(_dirPath).create(recursive: true);
  }

  Future<void> _writeImagesInSequence() async {
    for (int i = 0; i < inputImages.length; i++) {
      final image = inputImages[i];

      await File('$_dirPath/image_${i + 1}.$_extension')
          .writeAsBytes(image.readAsBytesSync());
      _tempDirectoryImages.add(File('$_dirPath/image_${i + 1}.$_extension'));
    }
  }

  Future<void> _initVideoGenerator() async {
    double inputFramerate = inputImages.length / 2.5;

    if (inputImages.length == 1) {
      inputFramerate = 1;
    } else if (inputImages.length / 2 <= 2) {
      inputFramerate = inputImages.length.toDouble() / 1.5;
    } else if (inputImages.length / 3.5 <= 2) {
      inputFramerate = inputImages.length / 2;
    } else {
      inputFramerate = inputImages.length / 2.75;
    }

    DateTime now = DateTime.now(), after;

//---------------------------------STANDARD
//                                DEFINITION-----------------------------
    // setting SD quality path to be consumed by user
    _thumbMP4Path = await generateVideo(VideoGenerator(
      inputFramerate: inputFramerate,
      videoPath: '$_dirPath/${_tempFolder}_thumb.mp4',
      imageIdentifiers: '$_dirPath/image_360_%d.jpg',
      imageScalar: ImageScalar(
        dirPath: _dirPath,
        images: _tempDirectoryImages,
        extension: _extension,
        width: 360,
      ),
    ));

    onThumbnailReady(_thumbMP4Path);

    after = DateTime.now();

    _logger.d('SD, total time: ${after.difference(now).inMilliseconds}');
    now = after;

//---------------------------------HIGH
//                                DEFINITION-----------------------------

    // setting HD quality path to be consumed by user
    _hdMP4Path = await generateVideo(VideoGenerator(
      inputFramerate: inputFramerate,
      videoPath: '$_dirPath/${_tempFolder}_HD.mp4',
      imageIdentifiers: '$_dirPath/image_1080_%d.jpg',
      imageScalar: ImageScalar(
        dirPath: _dirPath,
        images: _tempDirectoryImages,
        extension: _extension,
        width: 1080,
      ),
    ));

    after = DateTime.now();
    _logger.d('HD, total time: ${after.difference(now).inMilliseconds}');
  }

  Future<void> deleteAllResources() async {
    // delete the images and videos
    try {
      await _completer.future;
      await Directory(_dirPath).delete(recursive: true);
    } catch (e) {
      _logger.v('error while deleting resources : $e');
    }
  }

  String _hdMP4Path;
  String _thumbMP4Path;

  String get hdMP4Path => _hdMP4Path;
  String get thumbMP4Path => _thumbMP4Path;
  Completer<void> get completer => _completer;
}
