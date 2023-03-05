// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'edit_user_model.g.dart';

abstract class EditUserModel
    implements Built<EditUserModel, EditUserModelBuilder> {
  factory EditUserModel([Function(EditUserModelBuilder b) updates]) =
      _$EditUserModel;
  EditUserModel._();

  String? get fullname;
  String? get email;
  DateTime? get dob;

  static Serializer<EditUserModel> get serializer => _$editUserModelSerializer;
}
