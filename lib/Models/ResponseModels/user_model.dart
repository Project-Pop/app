// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

// Project imports:
import 'user_profile_model.dart';

part 'user_model.g.dart';

abstract class UserModel implements Built<UserModel, UserModelBuilder> {
  factory UserModel([Function(UserModelBuilder b) updates]) = _$UserModel;
  UserModel._();

  String get username;

  String get fullname;

  String? get email;

  String? get phone;

  DateTime? get dob;

  UserProfileModel get userProfile;

  static Serializer<UserModel> get serializer => _$userModelSerializer;
}
