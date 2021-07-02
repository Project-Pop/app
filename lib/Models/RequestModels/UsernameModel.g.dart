// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UsernameModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsernameModel> _$usernameModelSerializer =
    new _$UsernameModelSerializer();

class _$UsernameModelSerializer implements StructuredSerializer<UsernameModel> {
  @override
  final Iterable<Type> types = const [UsernameModel, _$UsernameModel];
  @override
  final String wireName = 'UsernameModel';

  @override
  Iterable<Object> serialize(Serializers serializers, UsernameModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UsernameModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsernameModelBuilder();

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
      }
    }

    return result.build();
  }
}

class _$UsernameModel extends UsernameModel {
  @override
  final String username;

  factory _$UsernameModel([void Function(UsernameModelBuilder) updates]) =>
      (new UsernameModelBuilder()..update(updates)).build();

  _$UsernameModel._({this.username}) : super._() {
    if (username == null) {
      throw new BuiltValueNullFieldError('UsernameModel', 'username');
    }
  }

  @override
  UsernameModel rebuild(void Function(UsernameModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsernameModelBuilder toBuilder() => new UsernameModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsernameModel && username == other.username;
  }

  @override
  int get hashCode {
    return $jf($jc(0, username.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UsernameModel')
          ..add('username', username))
        .toString();
  }
}

class UsernameModelBuilder
    implements Builder<UsernameModel, UsernameModelBuilder> {
  _$UsernameModel _$v;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  UsernameModelBuilder();

  UsernameModelBuilder get _$this {
    if (_$v != null) {
      _username = _$v.username;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsernameModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UsernameModel;
  }

  @override
  void update(void Function(UsernameModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UsernameModel build() {
    final _$result = _$v ?? new _$UsernameModel._(username: username);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
