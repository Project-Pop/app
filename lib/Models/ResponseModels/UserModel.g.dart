// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserModel> _$userModelSerializer = new _$UserModelSerializer();

class _$UserModelSerializer implements StructuredSerializer<UserModel> {
  @override
  final Iterable<Type> types = const [UserModel, _$UserModel];
  @override
  final String wireName = 'UserModel';

  @override
  Iterable<Object> serialize(Serializers serializers, UserModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'fullname',
      serializers.serialize(object.fullname,
          specifiedType: const FullType(String)),
      'userProfile',
      serializers.serialize(object.userProfile,
          specifiedType: const FullType(UserProfileModel)),
    ];
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.phone != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(object.phone,
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
  UserModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserModelBuilder();

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
        case 'userProfile':
          result.userProfile.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserProfileModel))
              as UserProfileModel);
          break;
      }
    }

    return result.build();
  }
}

class _$UserModel extends UserModel {
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
  @override
  final UserProfileModel userProfile;

  factory _$UserModel([void Function(UserModelBuilder) updates]) =>
      (new UserModelBuilder()..update(updates)).build();

  _$UserModel._(
      {this.username,
      this.fullname,
      this.email,
      this.phone,
      this.dob,
      this.userProfile})
      : super._() {
    if (username == null) {
      throw new BuiltValueNullFieldError('UserModel', 'username');
    }
    if (fullname == null) {
      throw new BuiltValueNullFieldError('UserModel', 'fullname');
    }
    if (userProfile == null) {
      throw new BuiltValueNullFieldError('UserModel', 'userProfile');
    }
  }

  @override
  UserModel rebuild(void Function(UserModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserModelBuilder toBuilder() => new UserModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserModel &&
        username == other.username &&
        fullname == other.fullname &&
        email == other.email &&
        phone == other.phone &&
        dob == other.dob &&
        userProfile == other.userProfile;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, username.hashCode), fullname.hashCode),
                    email.hashCode),
                phone.hashCode),
            dob.hashCode),
        userProfile.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserModel')
          ..add('username', username)
          ..add('fullname', fullname)
          ..add('email', email)
          ..add('phone', phone)
          ..add('dob', dob)
          ..add('userProfile', userProfile))
        .toString();
  }
}

class UserModelBuilder implements Builder<UserModel, UserModelBuilder> {
  _$UserModel _$v;

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

  UserProfileModelBuilder _userProfile;
  UserProfileModelBuilder get userProfile =>
      _$this._userProfile ??= new UserProfileModelBuilder();
  set userProfile(UserProfileModelBuilder userProfile) =>
      _$this._userProfile = userProfile;

  UserModelBuilder();

  UserModelBuilder get _$this {
    if (_$v != null) {
      _username = _$v.username;
      _fullname = _$v.fullname;
      _email = _$v.email;
      _phone = _$v.phone;
      _dob = _$v.dob;
      _userProfile = _$v.userProfile?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserModel;
  }

  @override
  void update(void Function(UserModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserModel build() {
    _$UserModel _$result;
    try {
      _$result = _$v ??
          new _$UserModel._(
              username: username,
              fullname: fullname,
              email: email,
              phone: phone,
              dob: dob,
              userProfile: userProfile.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'userProfile';
        userProfile.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
