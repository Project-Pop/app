// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_profile_model.g.dart';

abstract class UserProfileModel
    implements Built<UserProfileModel, UserProfileModelBuilder> {
  factory UserProfileModel([Function(UserProfileModelBuilder b) updates]) =
      _$UserProfileModel;
  UserProfileModel._();

  int get views;
  int get reacts;
  int get popScore;
  int get followers;
  int get following;

  @nullable
  String get bio;

  static Serializer<UserProfileModel> get serializer =>
      _$userProfileModelSerializer;
}
