// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

// Project imports:
import '../Enums/index.dart';

part 'activity_model.g.dart';

abstract class ActivityModel
    implements Built<ActivityModel, ActivityModelBuilder> {
  factory ActivityModel([Function(ActivityModelBuilder b) updates]) =
      _$ActivityModel;
  ActivityModel._();

  NotificationType get notificationType;
  String get timestamp;
  String get title;
  String get primaryMediaUrl;

  @nullable
  String get secondaryMediaUrl;

  NotificationTargetType get targetType;
  String get targetResourceId;
  bool get opened;

  static Serializer<ActivityModel> get serializer => _$activityModelSerializer;
}
