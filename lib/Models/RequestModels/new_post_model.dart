// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

// Project imports:
import 'package:app/Models/RequestModels/username_model.dart';
import 'package:app/Services/ApiServices/Serializers/api_serializers.dart';

part 'new_post_model.g.dart';

abstract class NewPostModel
    implements Built<NewPostModel, NewPostModelBuilder> {
  factory NewPostModel([Function(NewPostModelBuilder b) updates]) =
      _$NewPostModel;
  NewPostModel._();

  // fields go here

  String get description;
  BuiltList<UsernameModel> get taggedUsers;

  String toJson() {
    return json.encode(
      serializers.serializeWith(NewPostModel.serializer, this),
    );
  }

  static Serializer<NewPostModel> get serializer => _$newPostModelSerializer;
}
