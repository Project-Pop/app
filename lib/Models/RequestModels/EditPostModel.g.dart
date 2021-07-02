// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EditPostModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EditPostModel> _$editPostModelSerializer =
    new _$EditPostModelSerializer();

class _$EditPostModelSerializer implements StructuredSerializer<EditPostModel> {
  @override
  final Iterable<Type> types = const [EditPostModel, _$EditPostModel];
  @override
  final String wireName = 'EditPostModel';

  @override
  Iterable<Object> serialize(Serializers serializers, EditPostModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  EditPostModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EditPostModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EditPostModel extends EditPostModel {
  @override
  final String description;

  factory _$EditPostModel([void Function(EditPostModelBuilder) updates]) =>
      (new EditPostModelBuilder()..update(updates)).build();

  _$EditPostModel._({this.description}) : super._() {
    if (description == null) {
      throw new BuiltValueNullFieldError('EditPostModel', 'description');
    }
  }

  @override
  EditPostModel rebuild(void Function(EditPostModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EditPostModelBuilder toBuilder() => new EditPostModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EditPostModel && description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc(0, description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EditPostModel')
          ..add('description', description))
        .toString();
  }
}

class EditPostModelBuilder
    implements Builder<EditPostModel, EditPostModelBuilder> {
  _$EditPostModel _$v;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  EditPostModelBuilder();

  EditPostModelBuilder get _$this {
    if (_$v != null) {
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EditPostModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EditPostModel;
  }

  @override
  void update(void Function(EditPostModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EditPostModel build() {
    final _$result = _$v ?? new _$EditPostModel._(description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
