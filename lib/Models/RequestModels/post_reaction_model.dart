// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_reaction_model.g.dart';

abstract class PostReactionModel
    implements Built<PostReactionModel, PostReactionModelBuilder> {
  factory PostReactionModel([Function(PostReactionModelBuilder b) updates]) =
      _$PostReactionModel;

  PostReactionModel._();

  String get reactionString;

  static Serializer<PostReactionModel> get serializer =>
      _$postReactionModelSerializer;
}
