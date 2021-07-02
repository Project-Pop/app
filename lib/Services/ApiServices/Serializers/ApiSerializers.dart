import 'package:app/Models/RequestModels/index.dart';
import 'package:app/Models/Enums/index.dart';
import 'package:app/Models/ResponseModels/index.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'ApiSerializers.g.dart';

@SerializersFor(const [
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
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
