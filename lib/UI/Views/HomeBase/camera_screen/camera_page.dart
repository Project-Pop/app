import 'dart:io';
import 'package:app/UI/Views/HomeBase/camera_screen/tag_page.dart';
import 'package:app/UI/Views/HomeBase/camera_screen/widgets/camera_zoom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:flutter_better_camera/camera.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:path_provider/path_provider.dart';

class OpenCamera extends StatefulWidget {
  const OpenCamera({Key key}) : super(key: key);

  @override
  _OpenCameraState createState() => _OpenCameraState();
}

class _OpenCameraState extends State<OpenCamera> {
  CameraController controller;
  FlashMode flashMode = FlashMode.off;
  List<CameraDescription> cameras = [];
  List<File> gallaryImages = <File>[];
  List<File> images = List.empty(growable: true);
  double _progress = 0;
  bool isCameraOrGallary = false;

  Future<void> initializeControllers() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    //detectCamera().then((value) => {initializeControllers()});
    initializeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(
          15.0,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: LinearProgressIndicator(
                backgroundColor: Colors.white12,
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.green.shade600),
                value: _progress,
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.81,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white12),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                      child: ZoomableWidget(
                          onTapUp: (scaledPoint) {
                            //controller.setPointOfInterest(scaledPoint);
                          },
                          onZoom: (zoom) {
                            if (zoom < 11) {
                              controller.zoom(zoom);
                            }
                          },
                          child: _cameraPreviewWidget())),
                )),
            Align(alignment: Alignment.topLeft, child: _flashButton()),
            if (images.isNotEmpty)
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _progress = 0;
                      images = [];
                      isCameraOrGallary = false;
                    });
                  },
                  child: Icon(
                    FlutterIcons.cross_ent,
                    color: Colors.white60,
                    size: 30,
                  ),
                ),
              )
            else
              Container(),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  onTakePictureButtonPressed();
                  setState(() {
                    isCameraOrGallary = true;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.green[600],
                  radius: 30,
                ),
              ),
            ),
            if (isCameraOrGallary)
              Container()
            else
              Align(
                alignment: Alignment.bottomLeft,
                child: InkWell(
                  onTap: () {
                    selectImagesFromGallery();
                  },
                  child: const Icon(
                    Icons.photo_album,
                    color: Colors.white60,
                    size: 30,
                  ),
                ),
              ),
            if (images.isNotEmpty)
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    FlutterIcons.check_ant,
                    color: Colors.white60,
                    size: 30,
                  ),
                ),
              )
            else
              Container()
          ],
        ),
      )),
    );
  }

  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Tap a camera',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller),
      );
    }
  }

  Widget _flashButton() {
    IconData iconData = Icons.flash_off;
    Color color = Colors.white60;
    if (flashMode == FlashMode.alwaysFlash) {
      iconData = Icons.flash_on;
      color = Colors.green;
    } else if (flashMode == FlashMode.autoFlash) {
      iconData = Icons.flash_auto;
      color = Colors.red;
    }
    return IconButton(
      icon: Icon(
        iconData,
        size: 26,
      ),
      color: color,
      onPressed: controller != null && controller.value.isInitialized
          ? _onFlashButtonPressed
          : null,
    );
  }

  Future<void> _onFlashButtonPressed() async {
    //bool hasFlash = false;
    if (flashMode == FlashMode.off || flashMode == FlashMode.torch) {
      // Turn on the flash for capture
      flashMode = FlashMode.alwaysFlash;
    } else if (flashMode == FlashMode.alwaysFlash) {
      // Turn on the flash for capture if needed
      flashMode = FlashMode.autoFlash;
    } else {
      // Turn off the flash
      flashMode = FlashMode.off;
    }
    // Apply the new mode
    await controller.setFlashMode(flashMode);

    setState(() {});
  }

  void onTakePictureButtonPressed() {
    if (images.length < 5) {
      takePicture().then((File file) {
        if (mounted) {
          setState(() {
            images.add(file);
            _progress = _progress + 0.2;
          });
          //if (filePath != null) showInSnackBar('Picture saved to $filePath');
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cant Take More Than 5 Picks')));
    }
  }

  Future<File> takePicture() async {
    String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

    if (!controller.value.isInitialized) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error: select a camera first.')));
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/images${timestamp()}.png';

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await controller.takePicture(filePath);
      print(filePath);
    } on CameraException catch (e) {
      return null;
    }
    return File(filePath);
  }

  Future<void> selectImagesFromGallery() async {
    //final multipleImage = await ImagePicker().pickMultiImage()}
    List<Asset> resultList = <Asset>[];
    List<Asset> selectedAsset = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5,
        selectedAssets: selectedAsset,
        cupertinoOptions: const CupertinoOptions(
          takePhotoIcon: 'chat',
          doneButtonTitle: 'Fatto',
        ),
        materialOptions: const MaterialOptions(
            actionBarColor: 'black',
            allViewTitle: 'All Photos',
            useDetailsView: false,
            selectCircleStrokeColor: 'black',

            // lightStatusBar: true,
            statusBarColor: 'black'),
      );
    } on Exception catch (e) {
      error = e.toString();
      print(error);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    for (int i = 0; i < resultList.length; i++) {
      final path =
          await FlutterAbsolutePath.getAbsolutePath(resultList[i].identifier);

      images.add(File(path));
      _progress = _progress + 0.2;
    }

    setState(() {
      selectedAsset = resultList;
      if (selectedAsset.isNotEmpty) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          _progress = 0;
          images = [];
          return const TagScreen();
        }));
      }
    });
  }
}
