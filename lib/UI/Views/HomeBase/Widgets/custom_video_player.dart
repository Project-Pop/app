import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({Key key, this.videoUrl}) : super(key: key);

  final String videoUrl;

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.videoUrl)
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((value) => controller.play());
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(
      controller: controller,
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({Key key, this.controller}) : super(key: key);
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
        child: VideoPlayer(controller));
  }
}
