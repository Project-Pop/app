// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'comment_model.g.dart';

abstract class CommentModel
    implements Built<CommentModel, CommentModelBuilder> {
  factory CommentModel([Function(CommentModelBuilder b) updates]) =
      _$CommentModel;
  CommentModel._();

  String get commentId;
  String get username;
  @nullable
  int get likeCount;

  String get message;

  static Serializer<CommentModel> get serializer => _$commentModelSerializer;
}
