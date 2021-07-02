import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'SignUpModel.g.dart';

abstract class SignUpModel implements Built<SignUpModel, SignUpModelBuilder> {
  // fields go here

  String get username;
  String get fullname;

  @nullable
  String get email;

  String get phone;

  DateTime get dob;

  SignUpModel._();

  factory SignUpModel([updates(SignUpModelBuilder b)]) = _$SignUpModel;

  static Serializer<SignUpModel> get serializer => _$signUpModelSerializer;
}
