import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'NotificationTargetType.g.dart';

class NotificationTargetType extends EnumClass {
  static Serializer<NotificationTargetType> get serializer =>
      _$notificationTargetTypeSerializer;

  @BuiltValueEnumConst(wireName: 'User')
  static const NotificationTargetType User = _$User;

  @BuiltValueEnumConst(wireName: 'Post')
  static const NotificationTargetType Post = _$Post;

  const NotificationTargetType._(String name) : super(name);

  static BuiltSet<NotificationTargetType> get values => _$values;
  static NotificationTargetType valueOf(String name) => _$valueOf(name);
}
