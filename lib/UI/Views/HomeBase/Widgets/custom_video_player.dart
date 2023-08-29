// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    Key? key,
    required this.videoUrl,
    this.isFileUrl = false,
  }) : super(key: key);

  final String videoUrl;
  final bool isFileUrl;

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? controller;
  @override
  void initState() {
    super.initState();

    if (widget.isFileUrl) {
      controller = VideoPlayerController.file(File(widget.videoUrl));
    } else {
      controller = VideoPlayerController.network(widget.videoUrl);
    }
    controller!
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      })
      ..setLooping(true)
      ..initialize().then((value) => controller?.play());
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(
      controller: controller!,
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({Key? key, required this.controller})
      : super(key: key);
  final VideoPlayerController controller;
  @override
  Widget build(BuildContext context) {
    return controller != null && controller.value.isInitialized
        ? buildVideo()
        : const SizedBox(
            height: 30,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  Widget buildVideo() {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller),
    );
  }
}
