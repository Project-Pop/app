import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'EditUserModel.g.dart';

abstract class EditUserModel
    implements Built<EditUserModel, EditUserModelBuilder> {
  @nullable
  String get fullname;
  @nullable
  String get email;
  @nullable
  DateTime get dob;

  EditUserModel._();

  factory EditUserModel([updates(EditUserModelBuilder b)]) = _$EditUserModel;

  static Serializer<EditUserModel> get serializer => _$editUserModelSerializer;
}
