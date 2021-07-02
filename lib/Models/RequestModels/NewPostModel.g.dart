// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewPostModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NewPostModel> _$newPostModelSerializer =
    new _$NewPostModelSerializer();

class _$NewPostModelSerializer implements StructuredSerializer<NewPostModel> {
  @override
  final Iterable<Type> types = const [NewPostModel, _$NewPostModel];
  @override
  final String wireName = 'NewPostModel';

  @override
  Iterable<Object> serialize(Serializers serializers, NewPostModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'taggedUsers',
      serializers.serialize(object.taggedUsers,
          specifiedType:
              const FullType(List, const [const FullType(UsernameModel)])),
    ];

    return result;
  }

  @override
  NewPostModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewPostModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'taggedUsers':
          result.taggedUsers = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(UsernameModel)]))
              as List<UsernameModel>;
          break;
      }
    }

    return result.build();
  }
}

class _$NewPostModel extends NewPostModel {
  @override
  final String description;
  @override
  final List<UsernameModel> taggedUsers;

  factory _$NewPostModel([void Function(NewPostModelBuilder) updates]) =>
      (new NewPostModelBuilder()..update(updates)).build();

  _$NewPostModel._({this.description, this.taggedUsers}) : super._() {
    if (description == null) {
      throw new BuiltValueNullFieldError('NewPostModel', 'description');
    }
    if (taggedUsers == null) {
      throw new BuiltValueNullFieldError('NewPostModel', 'taggedUsers');
    }
  }

  @override
  NewPostModel rebuild(void Function(NewPostModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewPostModelBuilder toBuilder() => new NewPostModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewPostModel &&
        description == other.description &&
        taggedUsers == other.taggedUsers;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, description.hashCode), taggedUsers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewPostModel')
          ..add('description', description)
          ..add('taggedUsers', taggedUsers))
        .toString();
  }
}

class NewPostModelBuilder
    implements Builder<NewPostModel, NewPostModelBuilder> {
  _$NewPostModel _$v;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  List<UsernameModel> _taggedUsers;
  List<UsernameModel> get taggedUsers => _$this._taggedUsers;
  set taggedUsers(List<UsernameModel> taggedUsers) =>
      _$this._taggedUsers = taggedUsers;

  NewPostModelBuilder();

  NewPostModelBuilder get _$this {
    if (_$v != null) {
      _description = _$v.description;
      _taggedUsers = _$v.taggedUsers;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewPostModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NewPostModel;
  }

  @override
  void update(void Function(NewPostModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NewPostModel build() {
    final _$result = _$v ??
        new _$NewPostModel._(
            description: description, taggedUsers: taggedUsers);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
