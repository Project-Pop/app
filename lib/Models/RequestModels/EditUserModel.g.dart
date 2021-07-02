// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EditUserModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EditUserModel> _$editUserModelSerializer =
    new _$EditUserModelSerializer();

class _$EditUserModelSerializer implements StructuredSerializer<EditUserModel> {
  @override
  final Iterable<Type> types = const [EditUserModel, _$EditUserModel];
  @override
  final String wireName = 'EditUserModel';

  @override
  Iterable<Object> serialize(Serializers serializers, EditUserModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.fullname != null) {
      result
        ..add('fullname')
        ..add(serializers.serialize(object.fullname,
            specifiedType: const FullType(String)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.dob != null) {
      result
        ..add('dob')
        ..add(serializers.serialize(object.dob,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  EditUserModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EditUserModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'fullname':
          result.fullname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dob':
          result.dob = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$EditUserModel extends EditUserModel {
  @override
  final String fullname;
  @override
  final String email;
  @override
  final DateTime dob;

  factory _$EditUserModel([void Function(EditUserModelBuilder) updates]) =>
      (new EditUserModelBuilder()..update(updates)).build();

  _$EditUserModel._({this.fullname, this.email, this.dob}) : super._();

  @override
  EditUserModel rebuild(void Function(EditUserModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EditUserModelBuilder toBuilder() => new EditUserModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EditUserModel &&
        fullname == other.fullname &&
        email == other.email &&
        dob == other.dob;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, fullname.hashCode), email.hashCode), dob.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EditUserModel')
          ..add('fullname', fullname)
          ..add('email', email)
          ..add('dob', dob))
        .toString();
  }
}

class EditUserModelBuilder
    implements Builder<EditUserModel, EditUserModelBuilder> {
  _$EditUserModel _$v;

  String _fullname;
  String get fullname => _$this._fullname;
  set fullname(String fullname) => _$this._fullname = fullname;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  DateTime _dob;
  DateTime get dob => _$this._dob;
  set dob(DateTime dob) => _$this._dob = dob;

  EditUserModelBuilder();

  EditUserModelBuilder get _$this {
    if (_$v != null) {
      _fullname = _$v.fullname;
      _email = _$v.email;
      _dob = _$v.dob;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EditUserModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EditUserModel;
  }

  @override
  void update(void Function(EditUserModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EditUserModel build() {
    final _$result = _$v ??
        new _$EditUserModel._(fullname: fullname, email: email, dob: dob);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
