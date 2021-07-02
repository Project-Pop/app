import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'UserProfileModel.dart';

part 'UserModel.g.dart';

abstract class UserModel implements Built<UserModel, UserModelBuilder> {
  String get username;
  String get fullname;

  @nullable
  String get email;

  @nullable
  String get phone;

  @nullable
  DateTime get dob;

  UserProfileModel get userProfile;

  UserModel._();

  factory UserModel([updates(UserModelBuilder b)]) = _$UserModel;

  static Serializer<UserModel> get serializer => _$userModelSerializer;
}
