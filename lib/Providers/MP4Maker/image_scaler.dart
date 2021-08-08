import 'dart:async';
import 'dart:io';

import 'package:app/Configs/custom_logger.dart';
import 'package:exif/exif.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

class ImageScalar {
  const ImageScalar({
    @required this.dirPath,
    @required this.images,
    @required this.extension,
    @required this.width,
  });
  final String dirPath;
  final List<File> images;
  final String extension;
  final int width;

  /// dimensions should always be even
  /// else generates error during compression
  int _scaledHeight(int originalHeight, int originalWidth) {
    final scalingFactor = originalWidth / width;
    final int height = (originalHeight / scalingFactor).floor();
    return height % 2 == 0 ? height : height + 1;
  }

  Future<void> writeAndScaleImage() async {
    final _logger = CustomLogger.logger(ImageScalar);
    final now = DateTime.now();
    for (int i = 0; i < images.length; i++) {
      final image = images[i];
      final imagePath = '$dirPath/image_${i + 1}.$extension';

      // to get the details about orientation of image
      // native images taken by camera usually contains this data
      // they store the data in rotated form
      // but display contrary to their storing mechanism
      // that's why sometimes we get rotated image and then
      // output will also be rotated if we don't parse exif data
      final data = await readExifFromBytes(await image.readAsBytes());

      // to get the dimensions of image
      final mediaStreamInfo =
          (await FlutterFFprobe().getMediaInformation(imagePath))
              .getStreams()
              .first
              .getAllProperties();

      final height = _scaledHeight(
        mediaStreamInfo['height'],
        mediaStreamInfo['width'],
      );

      final arguments = [
        '-i',
        imagePath,
        '-vf',
        'scale=$width:$height',
      ];

      if (data['Image Orientation'] != null &&
          data['Image Orientation'].printable.contains('90')) {
        final ccw = data['Image Orientation'].printable.contains('CCW') ||
            data['Image Orientation'].printable.contains('ccw');
        if (ccw) {
          arguments.last += ',transpose=2';
        } else {
          arguments.last += ',transpose=1';
        }
      }

      arguments.add('$dirPath/image_${width}_${i + 1}.jpg');

      final result = await FlutterFFmpeg().executeWithArguments(arguments);

      _logger.d('scaling to width:$width :total time: '
          '${DateTime.now().difference(now).inMilliseconds}: $result');
    }
  }
}
