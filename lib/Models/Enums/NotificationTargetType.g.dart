// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotificationTargetType.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const NotificationTargetType _$User = const NotificationTargetType._('User');
const NotificationTargetType _$Post = const NotificationTargetType._('Post');

NotificationTargetType _$valueOf(String name) {
  switch (name) {
    case 'User':
      return _$User;
    case 'Post':
      return _$Post;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<NotificationTargetType> _$values =
    new BuiltSet<NotificationTargetType>(const <NotificationTargetType>[
  _$User,
  _$Post,
]);

Serializer<NotificationTargetType> _$notificationTargetTypeSerializer =
    new _$NotificationTargetTypeSerializer();

class _$NotificationTargetTypeSerializer
    implements PrimitiveSerializer<NotificationTargetType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'User': 'User',
    'Post': 'Post',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'User': 'User',
    'Post': 'Post',
  };

  @override
  final Iterable<Type> types = const <Type>[NotificationTargetType];
  @override
  final String wireName = 'NotificationTargetType';

  @override
  Object serialize(Serializers serializers, NotificationTargetType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  NotificationTargetType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NotificationTargetType.valueOf(
          _fromWire[serialized] ?? serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
