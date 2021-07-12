// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sign_up_model.g.dart';

abstract class SignUpModel implements Built<SignUpModel, SignUpModelBuilder> {
  factory SignUpModel([Function(SignUpModelBuilder b) updates]) = _$SignUpModel;
  SignUpModel._();

  // fields go here

  String get username;
  String get fullname;

  @nullable
  String get email;

  @nullable
  DateTime get dob;

  static Serializer<SignUpModel> get serializer => _$signUpModelSerializer;
}
