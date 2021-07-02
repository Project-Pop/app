// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostReactionModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostReactionModel> _$postReactionModelSerializer =
    new _$PostReactionModelSerializer();

class _$PostReactionModelSerializer
    implements StructuredSerializer<PostReactionModel> {
  @override
  final Iterable<Type> types = const [PostReactionModel, _$PostReactionModel];
  @override
  final String wireName = 'PostReactionModel';

  @override
  Iterable<Object> serialize(Serializers serializers, PostReactionModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'reactionString',
      serializers.serialize(object.reactionString,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PostReactionModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostReactionModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'reactionString':
          result.reactionString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PostReactionModel extends PostReactionModel {
  @override
  final String reactionString;

  factory _$PostReactionModel(
          [void Function(PostReactionModelBuilder) updates]) =>
      (new PostReactionModelBuilder()..update(updates)).build();

  _$PostReactionModel._({this.reactionString}) : super._() {
    if (reactionString == null) {
      throw new BuiltValueNullFieldError('PostReactionModel', 'reactionString');
    }
  }

  @override
  PostReactionModel rebuild(void Function(PostReactionModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostReactionModelBuilder toBuilder() =>
      new PostReactionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostReactionModel && reactionString == other.reactionString;
  }

  @override
  int get hashCode {
    return $jf($jc(0, reactionString.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostReactionModel')
          ..add('reactionString', reactionString))
        .toString();
  }
}

class PostReactionModelBuilder
    implements Builder<PostReactionModel, PostReactionModelBuilder> {
  _$PostReactionModel _$v;

  String _reactionString;
  String get reactionString => _$this._reactionString;
  set reactionString(String reactionString) =>
      _$this._reactionString = reactionString;

  PostReactionModelBuilder();

  PostReactionModelBuilder get _$this {
    if (_$v != null) {
      _reactionString = _$v.reactionString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostReactionModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PostReactionModel;
  }

  @override
  void update(void Function(PostReactionModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostReactionModel build() {
    final _$result =
        _$v ?? new _$PostReactionModel._(reactionString: reactionString);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
