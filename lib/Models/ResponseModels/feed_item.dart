// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'feed_item.g.dart';

abstract class FeedItem implements Built<FeedItem, FeedItemBuilder> {
  factory FeedItem([Function(FeedItemBuilder b) updates]) = _$FeedItem;

  FeedItem._();

  // fields go here

  String get postId;
  String get imageUrl;
  String get timestamp;

  static Serializer<FeedItem> get serializer => _$feedItemSerializer;
}
