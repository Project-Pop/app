// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserProfileModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserProfileModel> _$userProfileModelSerializer =
    new _$UserProfileModelSerializer();

class _$UserProfileModelSerializer
    implements StructuredSerializer<UserProfileModel> {
  @override
  final Iterable<Type> types = const [UserProfileModel, _$UserProfileModel];
  @override
  final String wireName = 'UserProfileModel';

  @override
  Iterable<Object> serialize(Serializers serializers, UserProfileModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'views',
      serializers.serialize(object.views, specifiedType: const FullType(int)),
      'reacts',
      serializers.serialize(object.reacts, specifiedType: const FullType(int)),
      'popScore',
      serializers.serialize(object.popScore,
          specifiedType: const FullType(int)),
      'followers',
      serializers.serialize(object.followers,
          specifiedType: const FullType(int)),
      'following',
      serializers.serialize(object.following,
          specifiedType: const FullType(int)),
    ];
    if (object.bio != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(object.bio,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserProfileModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserProfileModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'views':
          result.views = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'reacts':
          result.reacts = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'popScore':
          result.popScore = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'followers':
          result.followers = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'following':
          result.following = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserProfileModel extends UserProfileModel {
  @override
  final int views;
  @override
  final int reacts;
  @override
  final int popScore;
  @override
  final int followers;
  @override
  final int following;
  @override
  final String bio;

  factory _$UserProfileModel(
          [void Function(UserProfileModelBuilder) updates]) =>
      (new UserProfileModelBuilder()..update(updates)).build();

  _$UserProfileModel._(
      {this.views,
      this.reacts,
      this.popScore,
      this.followers,
      this.following,
      this.bio})
      : super._() {
    if (views == null) {
      throw new BuiltValueNullFieldError('UserProfileModel', 'views');
    }
    if (reacts == null) {
      throw new BuiltValueNullFieldError('UserProfileModel', 'reacts');
    }
    if (popScore == null) {
      throw new BuiltValueNullFieldError('UserProfileModel', 'popScore');
    }
    if (followers == null) {
      throw new BuiltValueNullFieldError('UserProfileModel', 'followers');
    }
    if (following == null) {
      throw new BuiltValueNullFieldError('UserProfileModel', 'following');
    }
  }

  @override
  UserProfileModel rebuild(void Function(UserProfileModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserProfileModelBuilder toBuilder() =>
      new UserProfileModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserProfileModel &&
        views == other.views &&
        reacts == other.reacts &&
        popScore == other.popScore &&
        followers == other.followers &&
        following == other.following &&
        bio == other.bio;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, views.hashCode), reacts.hashCode),
                    popScore.hashCode),
                followers.hashCode),
            following.hashCode),
        bio.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserProfileModel')
          ..add('views', views)
          ..add('reacts', reacts)
          ..add('popScore', popScore)
          ..add('followers', followers)
          ..add('following', following)
          ..add('bio', bio))
        .toString();
  }
}

class UserProfileModelBuilder
    implements Builder<UserProfileModel, UserProfileModelBuilder> {
  _$UserProfileModel _$v;

  int _views;
  int get views => _$this._views;
  set views(int views) => _$this._views = views;

  int _reacts;
  int get reacts => _$this._reacts;
  set reacts(int reacts) => _$this._reacts = reacts;

  int _popScore;
  int get popScore => _$this._popScore;
  set popScore(int popScore) => _$this._popScore = popScore;

  int _followers;
  int get followers => _$this._followers;
  set followers(int followers) => _$this._followers = followers;

  int _following;
  int get following => _$this._following;
  set following(int following) => _$this._following = following;

  String _bio;
  String get bio => _$this._bio;
  set bio(String bio) => _$this._bio = bio;

  UserProfileModelBuilder();

  UserProfileModelBuilder get _$this {
    if (_$v != null) {
      _views = _$v.views;
      _reacts = _$v.reacts;
      _popScore = _$v.popScore;
      _followers = _$v.followers;
      _following = _$v.following;
      _bio = _$v.bio;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserProfileModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserProfileModel;
  }

  @override
  void update(void Function(UserProfileModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserProfileModel build() {
    final _$result = _$v ??
        new _$UserProfileModel._(
            views: views,
            reacts: reacts,
            popScore: popScore,
            followers: followers,
            following: following,
            bio: bio);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
