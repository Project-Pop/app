// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

// Project imports:
import 'package:app/Models/index.dart';

part 'user_relational_model.g.dart';

abstract class UserRelationalModel
    implements Built<UserRelationalModel, UserRelationalModelBuilder> {
  factory UserRelationalModel(
      [Function(UserRelationalModelBuilder b) updates]) = _$UserRelationalModel;
  UserRelationalModel._();

  // fields go here
  UserModel get user;
  bool get following;

  static Serializer<UserRelationalModel> get serializer =>
      _$userRelationalModelSerializer;
}
