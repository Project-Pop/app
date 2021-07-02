// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaggedUserModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaggedUserModel> _$taggedUserModelSerializer =
    new _$TaggedUserModelSerializer();

class _$TaggedUserModelSerializer
    implements StructuredSerializer<TaggedUserModel> {
  @override
  final Iterable<Type> types = const [TaggedUserModel, _$TaggedUserModel];
  @override
  final String wireName = 'TaggedUserModel';

  @override
  Iterable<Object> serialize(Serializers serializers, TaggedUserModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'postId',
      serializers.serialize(object.postId,
          specifiedType: const FullType(String)),
      'approvalStatus',
      serializers.serialize(object.approvalStatus,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  TaggedUserModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaggedUserModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'postId':
          result.postId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'approvalStatus':
          result.approvalStatus = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$TaggedUserModel extends TaggedUserModel {
  @override
  final String username;
  @override
  final String postId;
  @override
  final bool approvalStatus;

  factory _$TaggedUserModel([void Function(TaggedUserModelBuilder) updates]) =>
      (new TaggedUserModelBuilder()..update(updates)).build();

  _$TaggedUserModel._({this.username, this.postId, this.approvalStatus})
      : super._() {
    if (username == null) {
      throw new BuiltValueNullFieldError('TaggedUserModel', 'username');
    }
    if (postId == null) {
      throw new BuiltValueNullFieldError('TaggedUserModel', 'postId');
    }
    if (approvalStatus == null) {
      throw new BuiltValueNullFieldError('TaggedUserModel', 'approvalStatus');
    }
  }

  @override
  TaggedUserModel rebuild(void Function(TaggedUserModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaggedUserModelBuilder toBuilder() =>
      new TaggedUserModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaggedUserModel &&
        username == other.username &&
        postId == other.postId &&
        approvalStatus == other.approvalStatus;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, username.hashCode), postId.hashCode),
        approvalStatus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TaggedUserModel')
          ..add('username', username)
          ..add('postId', postId)
          ..add('approvalStatus', approvalStatus))
        .toString();
  }
}

class TaggedUserModelBuilder
    implements Builder<TaggedUserModel, TaggedUserModelBuilder> {
  _$TaggedUserModel _$v;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _postId;
  String get postId => _$this._postId;
  set postId(String postId) => _$this._postId = postId;

  bool _approvalStatus;
  bool get approvalStatus => _$this._approvalStatus;
  set approvalStatus(bool approvalStatus) =>
      _$this._approvalStatus = approvalStatus;

  TaggedUserModelBuilder();

  TaggedUserModelBuilder get _$this {
    if (_$v != null) {
      _username = _$v.username;
      _postId = _$v.postId;
      _approvalStatus = _$v.approvalStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaggedUserModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TaggedUserModel;
  }

  @override
  void update(void Function(TaggedUserModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TaggedUserModel build() {
    final _$result = _$v ??
        new _$TaggedUserModel._(
            username: username, postId: postId, approvalStatus: approvalStatus);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
