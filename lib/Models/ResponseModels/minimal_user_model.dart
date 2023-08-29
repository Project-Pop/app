// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'minimal_user_model.g.dart';

abstract class MinimalUserModel
    implements Built<MinimalUserModel, MinimalUserModelBuilder> {
  factory MinimalUserModel([Function(MinimalUserModelBuilder b) updates]) =
      _$MinimalUserModel;
  MinimalUserModel._();

  String get username;
  String get fullname;

  String? get imageUrl;

  static Serializer<MinimalUserModel> get serializer =>
      _$minimalUserModelSerializer;
}
