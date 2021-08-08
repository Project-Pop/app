import 'dart:typed_data';

import 'package:app/Models/RequestModels/new_post_model.dart';
import 'package:app/Providers/PostProvider/post_provider_interface.dart';
import 'package:app/Services/ApiServices/index.dart';
import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier implements PostProviderInterface {
  PostProvider({
    @required this.context,
  });
  final BuildContext context;
  final PostApiService _postApiService = PostApiService.instance;

  @override
  Future<void> postThePost({
    @required NewPostModel newPostModel,
    @required String hdVideoPath,
    @required String thumbVideoPath,
  }) async {
    await _postApiService.createPost(
        newPostModelJSON: newPostModel.toJson(),
        hdVideoPath: hdVideoPath,
        thumbVideoPath: thumbVideoPath);
  }
}
