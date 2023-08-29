// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tagged_user_model.g.dart';

abstract class TaggedUserModel
    implements Built<TaggedUserModel, TaggedUserModelBuilder> {
  factory TaggedUserModel([Function(TaggedUserModelBuilder b) updates]) =
      _$TaggedUserModel;
  TaggedUserModel._();

  String get username;
  String get postId;
  bool get approvalStatus;

  static Serializer<TaggedUserModel> get serializer =>
      _$taggedUserModelSerializer;
}
