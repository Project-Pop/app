import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'UsernameModel.g.dart';

abstract class UsernameModel
    implements Built<UsernameModel, UsernameModelBuilder> {
  // fields go here
  String get username;

  UsernameModel._();

  factory UsernameModel([updates(UsernameModelBuilder b)]) = _$UsernameModel;

  static Serializer<UsernameModel> get serializer => _$usernameModelSerializer;
}
