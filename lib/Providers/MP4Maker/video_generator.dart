import 'dart:async';

import 'package:app/Configs/custom_logger.dart';
import 'package:app/Providers/MP4Maker/image_scaler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

class VideoGenerator {
  VideoGenerator({
    @required this.inputFramerate,
    @required this.videoPath,
    @required this.imageIdentifiers,
    @required this.imageScalar,
  });
  final double inputFramerate;
  final String videoPath;
  final String imageIdentifiers;
  final ImageScalar imageScalar;
}

Future<String> generateVideo(VideoGenerator videoGenerator) async {
  final _logger = CustomLogger.logger(VideoGenerator);

  // first writing scaled images
  await videoGenerator.imageScalar.writeAndScaleImage();
  final arguments = [
    '-r', '${videoGenerator.inputFramerate}', // input reading speed

    '-i', videoGenerator.imageIdentifiers, // input

    '-c:v', 'libx264', // use  H.264 encoding

    '-r', '6', // output framerate

    // to increase the compatibility of this
    // video with wide range of players
    '-pix_fmt', 'yuv420p',

    videoGenerator.videoPath,
  ];

  final now = DateTime.now();

  final result = await FlutterFFmpeg().executeWithArguments(arguments);

  _logger
      .d('ffmpeg video time: ${DateTime.now().difference(now).inMilliseconds} '
          ': $result');

  return videoGenerator.videoPath;
}
