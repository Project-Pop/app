import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ReactionModel.g.dart';

abstract class ReactionModel
    implements Built<ReactionModel, ReactionModelBuilder> {
  String get reactionString;
  @nullable
  int get count;

  ReactionModel._();

  factory ReactionModel([updates(ReactionModelBuilder b)]) = _$ReactionModel;

  static Serializer<ReactionModel> get serializer => _$reactionModelSerializer;
}
