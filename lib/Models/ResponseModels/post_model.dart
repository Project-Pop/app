// Package imports:
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

// Project imports:
import 'package:app/Models/ResponseModels/reaction_model.dart';
import 'package:app/Models/ResponseModels/tagged_user_model.dart';

part 'post_model.g.dart';

abstract class PostModel implements Built<PostModel, PostModelBuilder> {
  factory PostModel([Function(PostModelBuilder b) updates]) = _$PostModel;
  PostModel._();

  String get postId;
  String get imageUrl;
  String get username;

  String? get description;

  BuiltList<ReactionModel>? get reactions;

  BuiltList<TaggedUserModel>? get taggedUsers;

  int get views;
  String get timestamp;

  static Serializer<PostModel> get serializer => _$postModelSerializer;
}
