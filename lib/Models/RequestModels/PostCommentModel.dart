import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'PostCommentModel.g.dart';

abstract class PostCommentModel
    implements Built<PostCommentModel, PostCommentModelBuilder> {
  String get message;

  PostCommentModel._();

  factory PostCommentModel([updates(PostCommentModelBuilder b)]) =
      _$PostCommentModel;

  static Serializer<PostCommentModel> get serializer =>
      _$postCommentModelSerializer;
}
