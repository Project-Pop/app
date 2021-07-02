// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentModel> _$commentModelSerializer =
    new _$CommentModelSerializer();

class _$CommentModelSerializer implements StructuredSerializer<CommentModel> {
  @override
  final Iterable<Type> types = const [CommentModel, _$CommentModel];
  @override
  final String wireName = 'CommentModel';

  @override
  Iterable<Object> serialize(Serializers serializers, CommentModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'commentId',
      serializers.serialize(object.commentId,
          specifiedType: const FullType(String)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];
    if (object.likeCount != null) {
      result
        ..add('likeCount')
        ..add(serializers.serialize(object.likeCount,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CommentModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'commentId':
          result.commentId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'likeCount':
          result.likeCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CommentModel extends CommentModel {
  @override
  final String commentId;
  @override
  final String username;
  @override
  final int likeCount;
  @override
  final String message;

  factory _$CommentModel([void Function(CommentModelBuilder) updates]) =>
      (new CommentModelBuilder()..update(updates)).build();

  _$CommentModel._(
      {this.commentId, this.username, this.likeCount, this.message})
      : super._() {
    if (commentId == null) {
      throw new BuiltValueNullFieldError('CommentModel', 'commentId');
    }
    if (username == null) {
      throw new BuiltValueNullFieldError('CommentModel', 'username');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('CommentModel', 'message');
    }
  }

  @override
  CommentModel rebuild(void Function(CommentModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentModelBuilder toBuilder() => new CommentModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentModel &&
        commentId == other.commentId &&
        username == other.username &&
        likeCount == other.likeCount &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, commentId.hashCode), username.hashCode),
            likeCount.hashCode),
        message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CommentModel')
          ..add('commentId', commentId)
          ..add('username', username)
          ..add('likeCount', likeCount)
          ..add('message', message))
        .toString();
  }
}

class CommentModelBuilder
    implements Builder<CommentModel, CommentModelBuilder> {
  _$CommentModel _$v;

  String _commentId;
  String get commentId => _$this._commentId;
  set commentId(String commentId) => _$this._commentId = commentId;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  int _likeCount;
  int get likeCount => _$this._likeCount;
  set likeCount(int likeCount) => _$this._likeCount = likeCount;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  CommentModelBuilder();

  CommentModelBuilder get _$this {
    if (_$v != null) {
      _commentId = _$v.commentId;
      _username = _$v.username;
      _likeCount = _$v.likeCount;
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CommentModel;
  }

  @override
  void update(void Function(CommentModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CommentModel build() {
    final _$result = _$v ??
        new _$CommentModel._(
            commentId: commentId,
            username: username,
            likeCount: likeCount,
            message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
