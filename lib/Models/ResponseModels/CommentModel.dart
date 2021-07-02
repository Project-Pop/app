import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'CommentModel.g.dart';

abstract class CommentModel
    implements Built<CommentModel, CommentModelBuilder> {
  String get commentId;
  String get username;
  @nullable
  int get likeCount;

  String get message;

  CommentModel._();

  factory CommentModel([updates(CommentModelBuilder b)]) = _$CommentModel;

  static Serializer<CommentModel> get serializer => _$commentModelSerializer;
}
