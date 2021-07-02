// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TagApprovalModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TagApprovalModel> _$tagApprovalModelSerializer =
    new _$TagApprovalModelSerializer();

class _$TagApprovalModelSerializer
    implements StructuredSerializer<TagApprovalModel> {
  @override
  final Iterable<Type> types = const [TagApprovalModel, _$TagApprovalModel];
  @override
  final String wireName = 'TagApprovalModel';

  @override
  Iterable<Object> serialize(Serializers serializers, TagApprovalModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isApproved',
      serializers.serialize(object.isApproved,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  TagApprovalModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TagApprovalModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isApproved':
          result.isApproved = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$TagApprovalModel extends TagApprovalModel {
  @override
  final bool isApproved;

  factory _$TagApprovalModel(
          [void Function(TagApprovalModelBuilder) updates]) =>
      (new TagApprovalModelBuilder()..update(updates)).build();

  _$TagApprovalModel._({this.isApproved}) : super._() {
    if (isApproved == null) {
      throw new BuiltValueNullFieldError('TagApprovalModel', 'isApproved');
    }
  }

  @override
  TagApprovalModel rebuild(void Function(TagApprovalModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TagApprovalModelBuilder toBuilder() =>
      new TagApprovalModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TagApprovalModel && isApproved == other.isApproved;
  }

  @override
  int get hashCode {
    return $jf($jc(0, isApproved.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TagApprovalModel')
          ..add('isApproved', isApproved))
        .toString();
  }
}

class TagApprovalModelBuilder
    implements Builder<TagApprovalModel, TagApprovalModelBuilder> {
  _$TagApprovalModel _$v;

  bool _isApproved;
  bool get isApproved => _$this._isApproved;
  set isApproved(bool isApproved) => _$this._isApproved = isApproved;

  TagApprovalModelBuilder();

  TagApprovalModelBuilder get _$this {
    if (_$v != null) {
      _isApproved = _$v.isApproved;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TagApprovalModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TagApprovalModel;
  }

  @override
  void update(void Function(TagApprovalModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TagApprovalModel build() {
    final _$result = _$v ?? new _$TagApprovalModel._(isApproved: isApproved);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
