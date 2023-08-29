// Package imports:
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notification_type.g.dart';

class NotificationType extends EnumClass {
  const NotificationType._(String name) : super(name);

  static Serializer<NotificationType> get serializer =>
      _$notificationTypeSerializer;

  @BuiltValueEnumConst(wireName: 'Follow')
  static const NotificationType follow = _$Follow;

  @BuiltValueEnumConst(wireName: 'TagRequest')
  static const NotificationType tagRequest = _$TagRequest;

  @BuiltValueEnumConst(wireName: 'TagResponse')
  static const NotificationType tagResponse = _$TagResponse;

  @BuiltValueEnumConst(wireName: 'PostReaction')
  static const NotificationType postReaction = _$PostReaction;

  @BuiltValueEnumConst(wireName: 'Comment')
  static const NotificationType comment = _$Comment;

  @BuiltValueEnumConst(wireName: 'CommentReaction')
  static const NotificationType commentReaction = _$CommentReaction;

  static BuiltSet<NotificationType> get values => _$values;
  static NotificationType valueOf(String name) => _$valueOf(name);
}
