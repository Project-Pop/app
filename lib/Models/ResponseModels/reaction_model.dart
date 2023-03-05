// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reaction_model.g.dart';

abstract class ReactionModel
    implements Built<ReactionModel, ReactionModelBuilder> {
  factory ReactionModel([Function(ReactionModelBuilder b) updates]) =
      _$ReactionModel;
  ReactionModel._();

  String get reactionString;

  int? get count;

  static Serializer<ReactionModel> get serializer => _$reactionModelSerializer;
}
