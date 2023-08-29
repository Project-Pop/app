// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'username_model.g.dart';

abstract class UsernameModel
    implements Built<UsernameModel, UsernameModelBuilder> {
  factory UsernameModel([Function(UsernameModelBuilder b) updates]) =
      _$UsernameModel;

  UsernameModel._();

  // fields go here
  String get username;

  static Serializer<UsernameModel> get serializer => _$usernameModelSerializer;
}
