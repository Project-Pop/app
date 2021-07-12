// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'edit_post_model.g.dart';

abstract class EditPostModel
    implements Built<EditPostModel, EditPostModelBuilder> {
  factory EditPostModel([Function(EditPostModelBuilder b) updates]) =
      _$EditPostModel;

  EditPostModel._();

  String get description;

  static Serializer<EditPostModel> get serializer => _$editPostModelSerializer;
}
