import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'UserProfileModel.g.dart';

abstract class UserProfileModel
    implements Built<UserProfileModel, UserProfileModelBuilder> {
  int get views;
  int get reacts;
  int get popScore;
  int get followers;
  int get following;

  @nullable
  String get bio;

  UserProfileModel._();

  factory UserProfileModel([updates(UserProfileModelBuilder b)]) =
      _$UserProfileModel;

  static Serializer<UserProfileModel> get serializer =>
      _$userProfileModelSerializer;
}
