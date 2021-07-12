// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

// Project imports:
import 'package:app/Models/RequestModels/username_model.dart';

part 'new_post_model.g.dart';

abstract class NewPostModel
    implements Built<NewPostModel, NewPostModelBuilder> {
  factory NewPostModel([Function(NewPostModelBuilder b) updates]) =
      _$NewPostModel;
  NewPostModel._();

  // fields go here

  String get description;
  List<UsernameModel> get taggedUsers;

  static Serializer<NewPostModel> get serializer => _$newPostModelSerializer;
}
