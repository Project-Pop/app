// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostCommentModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostCommentModel> _$postCommentModelSerializer =
    new _$PostCommentModelSerializer();

class _$PostCommentModelSerializer
    implements StructuredSerializer<PostCommentModel> {
  @override
  final Iterable<Type> types = const [PostCommentModel, _$PostCommentModel];
  @override
  final String wireName = 'PostCommentModel';

  @override
  Iterable<Object> serialize(Serializers serializers, PostCommentModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PostCommentModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostCommentModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PostCommentModel extends PostCommentModel {
  @override
  final String message;

  factory _$PostCommentModel(
          [void Function(PostCommentModelBuilder) updates]) =>
      (new PostCommentModelBuilder()..update(updates)).build();

  _$PostCommentModel._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('PostCommentModel', 'message');
    }
  }

  @override
  PostCommentModel rebuild(void Function(PostCommentModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostCommentModelBuilder toBuilder() =>
      new PostCommentModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostCommentModel && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostCommentModel')
          ..add('message', message))
        .toString();
  }
}

class PostCommentModelBuilder
    implements Builder<PostCommentModel, PostCommentModelBuilder> {
  _$PostCommentModel _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  PostCommentModelBuilder();

  PostCommentModelBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostCommentModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PostCommentModel;
  }

  @override
  void update(void Function(PostCommentModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostCommentModel build() {
    final _$result = _$v ?? new _$PostCommentModel._(message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
