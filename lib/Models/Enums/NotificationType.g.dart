// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotificationType.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const NotificationType _$Follow = const NotificationType._('Follow');
const NotificationType _$TagRequest = const NotificationType._('TagRequest');
const NotificationType _$TagResponse = const NotificationType._('TagResponse');
const NotificationType _$PostReaction =
    const NotificationType._('PostReaction');
const NotificationType _$Comment = const NotificationType._('Comment');
const NotificationType _$CommentReaction =
    const NotificationType._('CommentReaction');

NotificationType _$valueOf(String name) {
  switch (name) {
    case 'Follow':
      return _$Follow;
    case 'TagRequest':
      return _$TagRequest;
    case 'TagResponse':
      return _$TagResponse;
    case 'PostReaction':
      return _$PostReaction;
    case 'Comment':
      return _$Comment;
    case 'CommentReaction':
      return _$CommentReaction;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<NotificationType> _$values =
    new BuiltSet<NotificationType>(const <NotificationType>[
  _$Follow,
  _$TagRequest,
  _$TagResponse,
  _$PostReaction,
  _$Comment,
  _$CommentReaction,
]);

Serializer<NotificationType> _$notificationTypeSerializer =
    new _$NotificationTypeSerializer();

class _$NotificationTypeSerializer
    implements PrimitiveSerializer<NotificationType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'Follow': 'Follow',
    'TagRequest': 'TagRequest',
    'TagResponse': 'TagResponse',
    'PostReaction': 'PostReaction',
    'Comment': 'Comment',
    'CommentReaction': 'CommentReaction',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Follow': 'Follow',
    'TagRequest': 'TagRequest',
    'TagResponse': 'TagResponse',
    'PostReaction': 'PostReaction',
    'Comment': 'Comment',
    'CommentReaction': 'CommentReaction',
  };

  @override
  final Iterable<Type> types = const <Type>[NotificationType];
  @override
  final String wireName = 'NotificationType';

  @override
  Object serialize(Serializers serializers, NotificationType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  NotificationType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NotificationType.valueOf(_fromWire[serialized] ?? serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
