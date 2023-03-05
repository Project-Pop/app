// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:video_player/video_player.dart';

class clipVideo extends StatefulWidget {
  final String path;
  clipVideo(this.path);
  @override
  _clipVideo createState() => _clipVideo();
}

class _clipVideo extends State<clipVideo> {
  String? _path;
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;
  @override
  void initState() {
    _path = widget.path;
    _controller = VideoPlayerController.network(widget.path);
    //_controller = VideoPlayerController.network(
    //   'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _initializeVideoPlayerFuture = _controller?.initialize();
    _controller?.play();
    _controller?.setVolume(0.0);
    _controller?.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: (_controller?.value.aspectRatio)!,
                child: VideoPlayer(_controller!),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class ShowVideos extends StatefulWidget {
  const ShowVideos({Key? key}) : super(key: key);

  @override
  _ShowVideosState createState() => _ShowVideosState();
}

class _ShowVideosState extends State<ShowVideos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              child: ListView(
        children: [
          SizedBox(height: 30.0),
          Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 20.0),
                  Flexible(
                      child: Text(
                    'Text',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xff40514e),
                        fontSize: 25.0,
                        fontFamily: 'Nurom',
                        fontWeight: FontWeight.w800),
                  )),
                  SizedBox(width: 15.0)
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 20.0),
                  Flexible(
                      child: Text(
                    'Text',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xff40514e),
                      fontSize: 18.0,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w200,
                    ),
                  )),
                  SizedBox(width: 30.0)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 550,
                child: clipVideo(
                    'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4'),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 20.0),
                  Flexible(
                      child: Text(
                    'Text',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xff40514e),
                        fontSize: 25.0,
                        fontFamily: 'Nurom',
                        fontWeight: FontWeight.w800),
                  ))
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 20.0),
                  Flexible(
                      child: Text(
                    'Text',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xff40514e),
                      fontSize: 18.0,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w200,
                    ),
                  )),
                  SizedBox(width: 40.0)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 550,
                child: clipVideo(
                    'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 20.0),
                  Flexible(
                      child: Text(
                    'Text',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xff40514e),
                      fontSize: 18.0,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w200,
                    ),
                  )),
                  SizedBox(width: 40.0)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 550,
                child: clipVideo(
                    'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 20.0),
                  Flexible(
                      child: Text(
                    'Text',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xff40514e),
                      fontSize: 18.0,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w200,
                    ),
                  )),
                  SizedBox(width: 40.0)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 550,
                child: clipVideo(
                    'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4'),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 20.0),
                  Flexible(
                      child: Text(
                    'Text',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xff40514e),
                      fontSize: 18.0,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w200,
                    ),
                  )),
                  SizedBox(width: 40.0)
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 20.0),
                  Flexible(
                      child: Text(
                    'Text',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xff40514e),
                      fontSize: 18.0,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w200,
                    ),
                  )),
                  SizedBox(width: 40.0)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 550,
                child: clipVideo(
                    'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 20.0),
                  Flexible(
                      child: Text(
                    'Text',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w200,
                    ),
                  )),
                  SizedBox(width: 40.0)
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 20.0),
                  Flexible(
                      child: Text(
                    'Text?',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xff40514e),
                        fontSize: 25.0,
                        fontFamily: 'Nurom',
                        fontWeight: FontWeight.w800),
                  ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 20.0),
                  Flexible(
                      child: Text(
                    'Text',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xff40514e),
                      fontSize: 18.0,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w200,
                    ),
                  )),
                  SizedBox(width: 40.0)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 550,
                child: clipVideo(
                    'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4'),
              ),
              SizedBox(
                height: 30,
              ),
              // Center(
              //     child: Flexible(
              //         child: Text(
              //   'Text',
              //   textAlign: TextAlign.start,
              //   style: TextStyle(
              //     color: Color(0xff40514e),
              //     fontSize: 18.0,
              //     fontFamily: 'Helvetica',
              //     fontWeight: FontWeight.w800,
              //   ),
              // ))),
              // SizedBox(
              //   height: 90,
              // )
            ],
          )
        ],
      ))),
    );
  }
}
