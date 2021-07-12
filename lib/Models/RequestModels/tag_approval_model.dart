// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tag_approval_model.g.dart';

abstract class TagApprovalModel
    implements Built<TagApprovalModel, TagApprovalModelBuilder> {
  factory TagApprovalModel([Function(TagApprovalModelBuilder b) updates]) =
      _$TagApprovalModel;

  TagApprovalModel._();

  bool get isApproved;

  static Serializer<TagApprovalModel> get serializer =>
      _$tagApprovalModelSerializer;
}
