import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'FeedItem.g.dart';

abstract class FeedItem implements Built<FeedItem, FeedItemBuilder> {
  // fields go here

  String get postId;
  String get imageUrl;
  String get timestamp;

  FeedItem._();

  factory FeedItem([updates(FeedItemBuilder b)]) = _$FeedItem;

  static Serializer<FeedItem> get serializer => _$feedItemSerializer;
}
