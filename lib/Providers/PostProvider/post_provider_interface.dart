// Dart imports:
import 'dart:io';

// Project imports:
import 'package:app/Models/index.dart';
import 'package:flutter/foundation.dart';

abstract class PostProviderInterface {
  Future<void> postThePost({
    @required NewPostModel newPostModel,
    @required String hdVideoPath,
    @required String thumbVideoPath,
  });
}
