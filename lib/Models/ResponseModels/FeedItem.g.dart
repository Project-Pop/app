// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FeedItem.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FeedItem> _$feedItemSerializer = new _$FeedItemSerializer();

class _$FeedItemSerializer implements StructuredSerializer<FeedItem> {
  @override
  final Iterable<Type> types = const [FeedItem, _$FeedItem];
  @override
  final String wireName = 'FeedItem';

  @override
  Iterable<Object> serialize(Serializers serializers, FeedItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'postId',
      serializers.serialize(object.postId,
          specifiedType: const FullType(String)),
      'imageUrl',
      serializers.serialize(object.imageUrl,
          specifiedType: const FullType(String)),
      'timestamp',
      serializers.serialize(object.timestamp,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  FeedItem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FeedItemBuilder();

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
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$FeedItem extends FeedItem {
  @override
  final String postId;
  @override
  final String imageUrl;
  @override
  final String timestamp;

  factory _$FeedItem([void Function(FeedItemBuilder) updates]) =>
      (new FeedItemBuilder()..update(updates)).build();

  _$FeedItem._({this.postId, this.imageUrl, this.timestamp}) : super._() {
    if (postId == null) {
      throw new BuiltValueNullFieldError('FeedItem', 'postId');
    }
    if (imageUrl == null) {
      throw new BuiltValueNullFieldError('FeedItem', 'imageUrl');
    }
    if (timestamp == null) {
      throw new BuiltValueNullFieldError('FeedItem', 'timestamp');
    }
  }

  @override
  FeedItem rebuild(void Function(FeedItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FeedItemBuilder toBuilder() => new FeedItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FeedItem &&
        postId == other.postId &&
        imageUrl == other.imageUrl &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, postId.hashCode), imageUrl.hashCode), timestamp.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FeedItem')
          ..add('postId', postId)
          ..add('imageUrl', imageUrl)
          ..add('timestamp', timestamp))
        .toString();
  }
}

class FeedItemBuilder implements Builder<FeedItem, FeedItemBuilder> {
  _$FeedItem _$v;

  String _postId;
  String get postId => _$this._postId;
  set postId(String postId) => _$this._postId = postId;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  String _timestamp;
  String get timestamp => _$this._timestamp;
  set timestamp(String timestamp) => _$this._timestamp = timestamp;

  FeedItemBuilder();

  FeedItemBuilder get _$this {
    if (_$v != null) {
      _postId = _$v.postId;
      _imageUrl = _$v.imageUrl;
      _timestamp = _$v.timestamp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FeedItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FeedItem;
  }

  @override
  void update(void Function(FeedItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FeedItem build() {
    final _$result = _$v ??
        new _$FeedItem._(
            postId: postId, imageUrl: imageUrl, timestamp: timestamp);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
