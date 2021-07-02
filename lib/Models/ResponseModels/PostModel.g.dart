// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostModel> _$postModelSerializer = new _$PostModelSerializer();

class _$PostModelSerializer implements StructuredSerializer<PostModel> {
  @override
  final Iterable<Type> types = const [PostModel, _$PostModel];
  @override
  final String wireName = 'PostModel';

  @override
  Iterable<Object> serialize(Serializers serializers, PostModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'postId',
      serializers.serialize(object.postId,
          specifiedType: const FullType(String)),
      'imageUrl',
      serializers.serialize(object.imageUrl,
          specifiedType: const FullType(String)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'views',
      serializers.serialize(object.views, specifiedType: const FullType(int)),
      'timestamp',
      serializers.serialize(object.timestamp,
          specifiedType: const FullType(DateTime)),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.reactions != null) {
      result
        ..add('reactions')
        ..add(serializers.serialize(object.reactions,
            specifiedType:
                const FullType(List, const [const FullType(ReactionModel)])));
    }
    if (object.taggedUsers != null) {
      result
        ..add('taggedUsers')
        ..add(serializers.serialize(object.taggedUsers,
            specifiedType:
                const FullType(List, const [const FullType(TaggedUserModel)])));
    }
    return result;
  }

  @override
  PostModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'postId':
          result.postId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'reactions':
          result.reactions = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(ReactionModel)]))
              as List<ReactionModel>;
          break;
        case 'taggedUsers':
          result.taggedUsers = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(TaggedUserModel)]))
              as List<TaggedUserModel>;
          break;
        case 'views':
          result.views = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$PostModel extends PostModel {
  @override
  final String postId;
  @override
  final String imageUrl;
  @override
  final String username;
  @override
  final String description;
  @override
  final List<ReactionModel> reactions;
  @override
  final List<TaggedUserModel> taggedUsers;
  @override
  final int views;
  @override
  final DateTime timestamp;

  factory _$PostModel([void Function(PostModelBuilder) updates]) =>
      (new PostModelBuilder()..update(updates)).build();

  _$PostModel._(
      {this.postId,
      this.imageUrl,
      this.username,
      this.description,
      this.reactions,
      this.taggedUsers,
      this.views,
      this.timestamp})
      : super._() {
    if (postId == null) {
      throw new BuiltValueNullFieldError('PostModel', 'postId');
    }
    if (imageUrl == null) {
      throw new BuiltValueNullFieldError('PostModel', 'imageUrl');
    }
    if (username == null) {
      throw new BuiltValueNullFieldError('PostModel', 'username');
    }
    if (views == null) {
      throw new BuiltValueNullFieldError('PostModel', 'views');
    }
    if (timestamp == null) {
      throw new BuiltValueNullFieldError('PostModel', 'timestamp');
    }
  }

  @override
  PostModel rebuild(void Function(PostModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostModelBuilder toBuilder() => new PostModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostModel &&
        postId == other.postId &&
        imageUrl == other.imageUrl &&
        username == other.username &&
        description == other.description &&
        reactions == other.reactions &&
        taggedUsers == other.taggedUsers &&
        views == other.views &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, postId.hashCode), imageUrl.hashCode),
                            username.hashCode),
                        description.hashCode),
                    reactions.hashCode),
                taggedUsers.hashCode),
            views.hashCode),
        timestamp.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostModel')
          ..add('postId', postId)
          ..add('imageUrl', imageUrl)
          ..add('username', username)
          ..add('description', description)
          ..add('reactions', reactions)
          ..add('taggedUsers', taggedUsers)
          ..add('views', views)
          ..add('timestamp', timestamp))
        .toString();
  }
}

class PostModelBuilder implements Builder<PostModel, PostModelBuilder> {
  _$PostModel _$v;

  String _postId;
  String get postId => _$this._postId;
  set postId(String postId) => _$this._postId = postId;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  List<ReactionModel> _reactions;
  List<ReactionModel> get reactions => _$this._reactions;
  set reactions(List<ReactionModel> reactions) => _$this._reactions = reactions;

  List<TaggedUserModel> _taggedUsers;
  List<TaggedUserModel> get taggedUsers => _$this._taggedUsers;
  set taggedUsers(List<TaggedUserModel> taggedUsers) =>
      _$this._taggedUsers = taggedUsers;

  int _views;
  int get views => _$this._views;
  set views(int views) => _$this._views = views;

  DateTime _timestamp;
  DateTime get timestamp => _$this._timestamp;
  set timestamp(DateTime timestamp) => _$this._timestamp = timestamp;

  PostModelBuilder();

  PostModelBuilder get _$this {
    if (_$v != null) {
      _postId = _$v.postId;
      _imageUrl = _$v.imageUrl;
      _username = _$v.username;
      _description = _$v.description;
      _reactions = _$v.reactions;
      _taggedUsers = _$v.taggedUsers;
      _views = _$v.views;
      _timestamp = _$v.timestamp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PostModel;
  }

  @override
  void update(void Function(PostModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostModel build() {
    final _$result = _$v ??
        new _$PostModel._(
            postId: postId,
            imageUrl: imageUrl,
            username: username,
            description: description,
            reactions: reactions,
            taggedUsers: taggedUsers,
            views: views,
            timestamp: timestamp);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
