// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignUpModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SignUpModel> _$signUpModelSerializer = new _$SignUpModelSerializer();

class _$SignUpModelSerializer implements StructuredSerializer<SignUpModel> {
  @override
  final Iterable<Type> types = const [SignUpModel, _$SignUpModel];
  @override
  final String wireName = 'SignUpModel';

  @override
  Iterable<Object> serialize(Serializers serializers, SignUpModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'fullname',
      serializers.serialize(object.fullname,
          specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
      'dob',
      serializers.serialize(object.dob,
          specifiedType: const FullType(DateTime)),
    ];
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SignUpModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SignUpModelBuilder();

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
        case 'fullname':
          result.fullname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
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

class _$SignUpModel extends SignUpModel {
  @override
  final String username;
  @override
  final String fullname;
  @override
  final String email;
  @override
  final String phone;
  @override
  final DateTime dob;

  factory _$SignUpModel([void Function(SignUpModelBuilder) updates]) =>
      (new SignUpModelBuilder()..update(updates)).build();

  _$SignUpModel._(
      {this.username, this.fullname, this.email, this.phone, this.dob})
      : super._() {
    if (username == null) {
      throw new BuiltValueNullFieldError('SignUpModel', 'username');
    }
    if (fullname == null) {
      throw new BuiltValueNullFieldError('SignUpModel', 'fullname');
    }
    if (phone == null) {
      throw new BuiltValueNullFieldError('SignUpModel', 'phone');
    }
    if (dob == null) {
      throw new BuiltValueNullFieldError('SignUpModel', 'dob');
    }
  }

  @override
  SignUpModel rebuild(void Function(SignUpModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignUpModelBuilder toBuilder() => new SignUpModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignUpModel &&
        username == other.username &&
        fullname == other.fullname &&
        email == other.email &&
        phone == other.phone &&
        dob == other.dob;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, username.hashCode), fullname.hashCode),
                email.hashCode),
            phone.hashCode),
        dob.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignUpModel')
          ..add('username', username)
          ..add('fullname', fullname)
          ..add('email', email)
          ..add('phone', phone)
          ..add('dob', dob))
        .toString();
  }
}

class SignUpModelBuilder implements Builder<SignUpModel, SignUpModelBuilder> {
  _$SignUpModel _$v;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _fullname;
  String get fullname => _$this._fullname;
  set fullname(String fullname) => _$this._fullname = fullname;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  DateTime _dob;
  DateTime get dob => _$this._dob;
  set dob(DateTime dob) => _$this._dob = dob;

  SignUpModelBuilder();

  SignUpModelBuilder get _$this {
    if (_$v != null) {
      _username = _$v.username;
      _fullname = _$v.fullname;
      _email = _$v.email;
      _phone = _$v.phone;
      _dob = _$v.dob;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignUpModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignUpModel;
  }

  @override
  void update(void Function(SignUpModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignUpModel build() {
    final _$result = _$v ??
        new _$SignUpModel._(
            username: username,
            fullname: fullname,
            email: email,
            phone: phone,
            dob: dob);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
