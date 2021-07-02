// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReactionModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReactionModel> _$reactionModelSerializer =
    new _$ReactionModelSerializer();

class _$ReactionModelSerializer implements StructuredSerializer<ReactionModel> {
  @override
  final Iterable<Type> types = const [ReactionModel, _$ReactionModel];
  @override
  final String wireName = 'ReactionModel';

  @override
  Iterable<Object> serialize(Serializers serializers, ReactionModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'reactionString',
      serializers.serialize(object.reactionString,
          specifiedType: const FullType(String)),
    ];
    if (object.count != null) {
      result
        ..add('count')
        ..add(serializers.serialize(object.count,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ReactionModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReactionModelBuilder();

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
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ReactionModel extends ReactionModel {
  @override
  final String reactionString;
  @override
  final int count;

  factory _$ReactionModel([void Function(ReactionModelBuilder) updates]) =>
      (new ReactionModelBuilder()..update(updates)).build();

  _$ReactionModel._({this.reactionString, this.count}) : super._() {
    if (reactionString == null) {
      throw new BuiltValueNullFieldError('ReactionModel', 'reactionString');
    }
  }

  @override
  ReactionModel rebuild(void Function(ReactionModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReactionModelBuilder toBuilder() => new ReactionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReactionModel &&
        reactionString == other.reactionString &&
        count == other.count;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, reactionString.hashCode), count.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReactionModel')
          ..add('reactionString', reactionString)
          ..add('count', count))
        .toString();
  }
}

class ReactionModelBuilder
    implements Builder<ReactionModel, ReactionModelBuilder> {
  _$ReactionModel _$v;

  String _reactionString;
  String get reactionString => _$this._reactionString;
  set reactionString(String reactionString) =>
      _$this._reactionString = reactionString;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  ReactionModelBuilder();

  ReactionModelBuilder get _$this {
    if (_$v != null) {
      _reactionString = _$v.reactionString;
      _count = _$v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReactionModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ReactionModel;
  }

  @override
  void update(void Function(ReactionModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ReactionModel build() {
    final _$result = _$v ??
        new _$ReactionModel._(reactionString: reactionString, count: count);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
