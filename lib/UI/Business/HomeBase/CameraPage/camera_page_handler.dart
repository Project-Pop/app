import 'dart:io';

import 'package:app/Models/index.dart';
import 'package:app/Providers/index.dart';
import 'package:app/UI/Views/HomeBase/camera_screen/camera_page.dart';
import 'package:app/UI/Views/HomeBase/camera_screen/tag_page.dart';
import 'package:app/UI/Views/models/search_user_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:built_collection/built_collection.dart';

class CameraPageHandler extends StatefulWidget {
  @override
  _CameraPageHandlerState createState() => _CameraPageHandlerState();
}

class _CameraPageHandlerState extends State<CameraPageHandler> {
  MP4Maker _mp4maker;
  final _thumnailNotifier = ValueNotifier<String>(null);
  var _cameraScreenKey = UniqueKey();

  Future<void> _uploadPost({
    @required BuildContext ctx,
    @required List<String> taggedUsernames,
    String description = '',
  }) async {
    final _postProvider = Provider.of<PostProvider>(context, listen: false);

    final newPostModel = NewPostModel(
      (b) => b
        ..description = description
        ..taggedUsers = taggedUsernames
            .map((username) => UsernameModel((b) => b..username = username))
            .toList()
            .build()
            .toBuilder(),
    );

    // waiting for mp4Maker to finish its work
    await _mp4maker.completer.future;

    await _postProvider.postThePost(
      newPostModel: newPostModel,
      hdVideoPath: _mp4maker.hdMP4Path,
      thumbVideoPath: _mp4maker.thumbMP4Path,
    );

    /** 
     * TODO: 
     * copy the videos, convert them to gif and
     * store them in external directory (named as application name)
     */
    await _mp4maker.deleteAllResources(); // deleting the created resources

    Fluttertoast.showToast(msg: 'Post created successfully');

    Navigator.of(ctx).pop(true); // popping the tag screen page
    setState(() {
      _cameraScreenKey = UniqueKey(); // to referesh the camera screen
    });
  }

  void _onThumbnailReady(String thumbnailPath) {
    _thumnailNotifier.value = thumbnailPath;
    return;
  }

  Future<List<SearchUser>> _searchUsers(String searchString) async {
    final _userProvider = Provider.of<UserProvider>(context, listen: false);

    final list = await _userProvider.searchUsers(searchString);
    return list
        .map((e) => SearchUser(
              imgUrl: e.imageUrl ?? 'assets/images/profile.png',
              name: e.fullname,
              username: e.username,
            ))
        .toList()
          ..removeWhere(
              (element) => element.username == _userProvider.user.username);
    // removing self username from search results if present
  }

  void _navigateToTagScreen(List<File> images) {
    _mp4maker =
        MP4Maker(inputImages: images, onThumbnailReady: _onThumbnailReady);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return TagScreen(
            key: UniqueKey(),
            searchUsers: _searchUsers,
            thumbnailNotifier: _thumnailNotifier,
            uploadPost: _uploadPost,
          );
        },
      ),
    ).then((res) {
      if (res == true) return;
      _thumnailNotifier.value = null;
      _mp4maker.deleteAllResources();
    });
  }

  @override
  Widget build(BuildContext context) {
    return OpenCamera(
      key: _cameraScreenKey,
      navigateToTagScreen: _navigateToTagScreen,
    );
  }
}
