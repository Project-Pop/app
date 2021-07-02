import 'package:app/Models/RequestModels/UsernameModel.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'NewPostModel.g.dart';

abstract class NewPostModel
    implements Built<NewPostModel, NewPostModelBuilder> {
  // fields go here

  String get description;
  List<UsernameModel> get taggedUsers;

  NewPostModel._();

  factory NewPostModel([updates(NewPostModelBuilder b)]) = _$NewPostModel;

  static Serializer<NewPostModel> get serializer => _$newPostModelSerializer;
}
