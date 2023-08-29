// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_comment_model.g.dart';

abstract class PostCommentModel
    implements Built<PostCommentModel, PostCommentModelBuilder> {
  factory PostCommentModel([Function(PostCommentModelBuilder b) updates]) =
      _$PostCommentModel;

  PostCommentModel._();

  String get message;

  static Serializer<PostCommentModel> get serializer =>
      _$postCommentModelSerializer;
}
