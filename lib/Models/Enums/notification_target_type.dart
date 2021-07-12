// Package imports:
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notification_target_type.g.dart';

class NotificationTargetType extends EnumClass {
  const NotificationTargetType._(String name) : super(name);

  static Serializer<NotificationTargetType> get serializer =>
      _$notificationTargetTypeSerializer;

  @BuiltValueEnumConst(wireName: 'User')
  static const NotificationTargetType user = _$User;

  @BuiltValueEnumConst(wireName: 'Post')
  static const NotificationTargetType post = _$Post;

  static BuiltSet<NotificationTargetType> get values => _$values;
  static NotificationTargetType valueOf(String name) => _$valueOf(name);
}
