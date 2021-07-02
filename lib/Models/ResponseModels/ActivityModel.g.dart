// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../ResponseModels/ActivityModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ActivityModel> _$activityModelSerializer =
    new _$ActivityModelSerializer();

class _$ActivityModelSerializer implements StructuredSerializer<ActivityModel> {
  @override
  final Iterable<Type> types = const [ActivityModel, _$ActivityModel];
  @override
  final String wireName = 'ActivityModel';

  @override
  Iterable<Object> serialize(Serializers serializers, ActivityModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'notificationType',
      serializers.serialize(object.notificationType,
          specifiedType: const FullType(NotificationType)),
      'timestamp',
      serializers.serialize(object.timestamp,
          specifiedType: const FullType(DateTime)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'primaryMediaUrl',
      serializers.serialize(object.primaryMediaUrl,
          specifiedType: const FullType(String)),
      'targetType',
      serializers.serialize(object.targetType,
          specifiedType: const FullType(NotificationTargetType)),
      'targetResourceId',
      serializers.serialize(object.targetResourceId,
          specifiedType: const FullType(String)),
      'opened',
      serializers.serialize(object.opened, specifiedType: const FullType(bool)),
    ];
    if (object.secondaryMediaUrl != null) {
      result
        ..add('secondaryMediaUrl')
        ..add(serializers.serialize(object.secondaryMediaUrl,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ActivityModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActivityModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'notificationType':
          result.notificationType = serializers.deserialize(value,
                  specifiedType: const FullType(NotificationType))
              as NotificationType;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'primaryMediaUrl':
          result.primaryMediaUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'secondaryMediaUrl':
          result.secondaryMediaUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'targetType':
          result.targetType = serializers.deserialize(value,
                  specifiedType: const FullType(NotificationTargetType))
              as NotificationTargetType;
          break;
        case 'targetResourceId':
          result.targetResourceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'opened':
          result.opened = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$ActivityModel extends ActivityModel {
  @override
  final NotificationType notificationType;
  @override
  final DateTime timestamp;
  @override
  final String title;
  @override
  final String primaryMediaUrl;
  @override
  final String secondaryMediaUrl;
  @override
  final NotificationTargetType targetType;
  @override
  final String targetResourceId;
  @override
  final bool opened;

  factory _$ActivityModel([void Function(ActivityModelBuilder) updates]) =>
      (new ActivityModelBuilder()..update(updates)).build();

  _$ActivityModel._(
      {this.notificationType,
      this.timestamp,
      this.title,
      this.primaryMediaUrl,
      this.secondaryMediaUrl,
      this.targetType,
      this.targetResourceId,
      this.opened})
      : super._() {
    if (notificationType == null) {
      throw new BuiltValueNullFieldError('ActivityModel', 'notificationType');
    }
    if (timestamp == null) {
      throw new BuiltValueNullFieldError('ActivityModel', 'timestamp');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('ActivityModel', 'title');
    }
    if (primaryMediaUrl == null) {
      throw new BuiltValueNullFieldError('ActivityModel', 'primaryMediaUrl');
    }
    if (targetType == null) {
      throw new BuiltValueNullFieldError('ActivityModel', 'targetType');
    }
    if (targetResourceId == null) {
      throw new BuiltValueNullFieldError('ActivityModel', 'targetResourceId');
    }
    if (opened == null) {
      throw new BuiltValueNullFieldError('ActivityModel', 'opened');
    }
  }

  @override
  ActivityModel rebuild(void Function(ActivityModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivityModelBuilder toBuilder() => new ActivityModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivityModel &&
        notificationType == other.notificationType &&
        timestamp == other.timestamp &&
        title == other.title &&
        primaryMediaUrl == other.primaryMediaUrl &&
        secondaryMediaUrl == other.secondaryMediaUrl &&
        targetType == other.targetType &&
        targetResourceId == other.targetResourceId &&
        opened == other.opened;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, notificationType.hashCode),
                                timestamp.hashCode),
                            title.hashCode),
                        primaryMediaUrl.hashCode),
                    secondaryMediaUrl.hashCode),
                targetType.hashCode),
            targetResourceId.hashCode),
        opened.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ActivityModel')
          ..add('notificationType', notificationType)
          ..add('timestamp', timestamp)
          ..add('title', title)
          ..add('primaryMediaUrl', primaryMediaUrl)
          ..add('secondaryMediaUrl', secondaryMediaUrl)
          ..add('targetType', targetType)
          ..add('targetResourceId', targetResourceId)
          ..add('opened', opened))
        .toString();
  }
}

class ActivityModelBuilder
    implements Builder<ActivityModel, ActivityModelBuilder> {
  _$ActivityModel _$v;

  NotificationType _notificationType;
  NotificationType get notificationType => _$this._notificationType;
  set notificationType(NotificationType notificationType) =>
      _$this._notificationType = notificationType;

  DateTime _timestamp;
  DateTime get timestamp => _$this._timestamp;
  set timestamp(DateTime timestamp) => _$this._timestamp = timestamp;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _primaryMediaUrl;
  String get primaryMediaUrl => _$this._primaryMediaUrl;
  set primaryMediaUrl(String primaryMediaUrl) =>
      _$this._primaryMediaUrl = primaryMediaUrl;

  String _secondaryMediaUrl;
  String get secondaryMediaUrl => _$this._secondaryMediaUrl;
  set secondaryMediaUrl(String secondaryMediaUrl) =>
      _$this._secondaryMediaUrl = secondaryMediaUrl;

  NotificationTargetType _targetType;
  NotificationTargetType get targetType => _$this._targetType;
  set targetType(NotificationTargetType targetType) =>
      _$this._targetType = targetType;

  String _targetResourceId;
  String get targetResourceId => _$this._targetResourceId;
  set targetResourceId(String targetResourceId) =>
      _$this._targetResourceId = targetResourceId;

  bool _opened;
  bool get opened => _$this._opened;
  set opened(bool opened) => _$this._opened = opened;

  ActivityModelBuilder();

  ActivityModelBuilder get _$this {
    if (_$v != null) {
      _notificationType = _$v.notificationType;
      _timestamp = _$v.timestamp;
      _title = _$v.title;
      _primaryMediaUrl = _$v.primaryMediaUrl;
      _secondaryMediaUrl = _$v.secondaryMediaUrl;
      _targetType = _$v.targetType;
      _targetResourceId = _$v.targetResourceId;
      _opened = _$v.opened;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivityModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ActivityModel;
  }

  @override
  void update(void Function(ActivityModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ActivityModel build() {
    final _$result = _$v ??
        new _$ActivityModel._(
            notificationType: notificationType,
            timestamp: timestamp,
            title: title,
            primaryMediaUrl: primaryMediaUrl,
            secondaryMediaUrl: secondaryMediaUrl,
            targetType: targetType,
            targetResourceId: targetResourceId,
            opened: opened);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
