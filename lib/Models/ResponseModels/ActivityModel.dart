import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../Enums/index.dart';
part 'ActivityModel.g.dart';

abstract class ActivityModel
    implements Built<ActivityModel, ActivityModelBuilder> {
  NotificationType get notificationType;
  DateTime get timestamp;
  String get title;
  String get primaryMediaUrl;

  @nullable
  String get secondaryMediaUrl;

  NotificationTargetType get targetType;
  String get targetResourceId;
  bool get opened;

  ActivityModel._();

  factory ActivityModel([updates(ActivityModelBuilder b)]) = _$ActivityModel;

  static Serializer<ActivityModel> get serializer => _$activityModelSerializer;
}
