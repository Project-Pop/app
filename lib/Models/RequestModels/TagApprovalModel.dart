import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'TagApprovalModel.g.dart';

abstract class TagApprovalModel
    implements Built<TagApprovalModel, TagApprovalModelBuilder> {
  bool get isApproved;

  TagApprovalModel._();

  factory TagApprovalModel([updates(TagApprovalModelBuilder b)]) =
      _$TagApprovalModel;

  static Serializer<TagApprovalModel> get serializer =>
      _$tagApprovalModelSerializer;
}
