// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_form_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OfflineFormDataModel _$OfflineFormDataModelFromJson(Map<String, dynamic> json) {
  return _OfflineFormDataModel.fromJson(json);
}

/// @nodoc
mixin _$OfflineFormDataModel {
  @HiveField(0)
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfflineFormDataModelCopyWith<OfflineFormDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflineFormDataModelCopyWith<$Res> {
  factory $OfflineFormDataModelCopyWith(OfflineFormDataModel value,
          $Res Function(OfflineFormDataModel) then) =
      _$OfflineFormDataModelCopyWithImpl<$Res, OfflineFormDataModel>;
  @useResult
  $Res call({@HiveField(0) Map<String, dynamic>? data});
}

/// @nodoc
class _$OfflineFormDataModelCopyWithImpl<$Res,
        $Val extends OfflineFormDataModel>
    implements $OfflineFormDataModelCopyWith<$Res> {
  _$OfflineFormDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfflineFormDataModelImplCopyWith<$Res>
    implements $OfflineFormDataModelCopyWith<$Res> {
  factory _$$OfflineFormDataModelImplCopyWith(_$OfflineFormDataModelImpl value,
          $Res Function(_$OfflineFormDataModelImpl) then) =
      __$$OfflineFormDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) Map<String, dynamic>? data});
}

/// @nodoc
class __$$OfflineFormDataModelImplCopyWithImpl<$Res>
    extends _$OfflineFormDataModelCopyWithImpl<$Res, _$OfflineFormDataModelImpl>
    implements _$$OfflineFormDataModelImplCopyWith<$Res> {
  __$$OfflineFormDataModelImplCopyWithImpl(_$OfflineFormDataModelImpl _value,
      $Res Function(_$OfflineFormDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$OfflineFormDataModelImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfflineFormDataModelImpl implements _OfflineFormDataModel {
  _$OfflineFormDataModelImpl({@HiveField(0) final Map<String, dynamic>? data})
      : _data = data;

  factory _$OfflineFormDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfflineFormDataModelImplFromJson(json);

  final Map<String, dynamic>? _data;
  @override
  @HiveField(0)
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'OfflineFormDataModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfflineFormDataModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfflineFormDataModelImplCopyWith<_$OfflineFormDataModelImpl>
      get copyWith =>
          __$$OfflineFormDataModelImplCopyWithImpl<_$OfflineFormDataModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfflineFormDataModelImplToJson(
      this,
    );
  }
}

abstract class _OfflineFormDataModel implements OfflineFormDataModel {
  factory _OfflineFormDataModel(
          {@HiveField(0) final Map<String, dynamic>? data}) =
      _$OfflineFormDataModelImpl;

  factory _OfflineFormDataModel.fromJson(Map<String, dynamic> json) =
      _$OfflineFormDataModelImpl.fromJson;

  @override
  @HiveField(0)
  Map<String, dynamic>? get data;
  @override
  @JsonKey(ignore: true)
  _$$OfflineFormDataModelImplCopyWith<_$OfflineFormDataModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
