import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'NotificationType.g.dart';

class NotificationType extends EnumClass {
  static Serializer<NotificationType> get serializer =>
      _$notificationTypeSerializer;

  @BuiltValueEnumConst(wireName: 'Follow')
  static const NotificationType Follow = _$Follow;

  @BuiltValueEnumConst(wireName: 'TagRequest')
  static const NotificationType TagRequest = _$TagRequest;

  @BuiltValueEnumConst(wireName: 'TagResponse')
  static const NotificationType TagResponse = _$TagResponse;

  @BuiltValueEnumConst(wireName: 'PostReaction')
  static const NotificationType PostReaction = _$PostReaction;

  @BuiltValueEnumConst(wireName: 'Comment')
  static const NotificationType Comment = _$Comment;

  @BuiltValueEnumConst(wireName: 'CommentReaction')
  static const NotificationType CommentReaction = _$CommentReaction;

  const NotificationType._(String name) : super(name);

  static BuiltSet<NotificationType> get values => _$values;
  static NotificationType valueOf(String name) => _$valueOf(name);
}
