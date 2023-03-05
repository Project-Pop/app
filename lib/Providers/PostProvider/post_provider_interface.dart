// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'package:app/Models/index.dart';

abstract class PostProviderInterface {
  Future<void> postThePost({
    required NewPostModel newPostModel,
    required String hdVideoPath,
    required String thumbVideoPath,
  });
}
