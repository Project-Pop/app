import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'TaggedUserModel.g.dart';

abstract class TaggedUserModel
    implements Built<TaggedUserModel, TaggedUserModelBuilder> {
  String get username;
  String get postId;
  bool get approvalStatus;

  TaggedUserModel._();

  factory TaggedUserModel([updates(TaggedUserModelBuilder b)]) =
      _$TaggedUserModel;

  static Serializer<TaggedUserModel> get serializer =>
      _$taggedUserModelSerializer;
}
