import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'EditPostModel.g.dart';

abstract class EditPostModel
    implements Built<EditPostModel, EditPostModelBuilder> {
  String get description;

  EditPostModel._();

  factory EditPostModel([updates(EditPostModelBuilder b)]) = _$EditPostModel;

  static Serializer<EditPostModel> get serializer => _$editPostModelSerializer;
}
