import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'PostReactionModel.g.dart';

abstract class PostReactionModel
    implements Built<PostReactionModel, PostReactionModelBuilder> {
  String get reactionString;

  PostReactionModel._();

  factory PostReactionModel([updates(PostReactionModelBuilder b)]) =
      _$PostReactionModel;

  static Serializer<PostReactionModel> get serializer =>
      _$postReactionModelSerializer;
}
