import 'package:app/Models/ResponseModels/ReactionModel.dart';
import 'package:app/Models/ResponseModels/TaggedUserModel.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'PostModel.g.dart';

abstract class PostModel implements Built<PostModel, PostModelBuilder> {
  String get postId;
  String get imageUrl;
  String get username;

  @nullable
  String get description;

  @nullable
  List<ReactionModel> get reactions;

  @nullable
  List<TaggedUserModel> get taggedUsers;

  int get views;
  DateTime get timestamp;

  PostModel._();

  factory PostModel([updates(PostModelBuilder b)]) = _$PostModel;

  static Serializer<PostModel> get serializer => _$postModelSerializer;
}
