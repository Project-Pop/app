// Package imports:
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

// Project imports:
import 'package:app/Models/Enums/index.dart';
import 'package:app/Models/RequestModels/index.dart';
import 'package:app/Models/ResponseModels/index.dart';

part 'api_serializers.g.dart';

@SerializersFor([
  SignUpModel,
  EditUserModel,
  ActivityModel,
  UserModel,
  NewPostModel,
  FeedItem,
  PostModel,
  EditPostModel,
  TagApprovalModel,
  PostReactionModel,
  CommentModel,
  MinimalUserModel,
  UserRelationalModel,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
