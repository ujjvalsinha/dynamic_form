// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dynamic_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DynamicFormModel _$DynamicFormModelFromJson(Map<String, dynamic> json) {
  return _DynamicFormModel.fromJson(json);
}

/// @nodoc
mixin _$DynamicFormModel {
  @JsonKey(name: 'form_name')
  String get formName => throw _privateConstructorUsedError;
  List<Field> get fields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DynamicFormModelCopyWith<DynamicFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DynamicFormModelCopyWith<$Res> {
  factory $DynamicFormModelCopyWith(
          DynamicFormModel value, $Res Function(DynamicFormModel) then) =
      _$DynamicFormModelCopyWithImpl<$Res, DynamicFormModel>;
  @useResult
  $Res call({@JsonKey(name: 'form_name') String formName, List<Field> fields});
}

/// @nodoc
class _$DynamicFormModelCopyWithImpl<$Res, $Val extends DynamicFormModel>
    implements $DynamicFormModelCopyWith<$Res> {
  _$DynamicFormModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formName = null,
    Object? fields = null,
  }) {
    return _then(_value.copyWith(
      formName: null == formName
          ? _value.formName
          : formName // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<Field>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DynamicFormModelImplCopyWith<$Res>
    implements $DynamicFormModelCopyWith<$Res> {
  factory _$$DynamicFormModelImplCopyWith(_$DynamicFormModelImpl value,
          $Res Function(_$DynamicFormModelImpl) then) =
      __$$DynamicFormModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'form_name') String formName, List<Field> fields});
}

/// @nodoc
class __$$DynamicFormModelImplCopyWithImpl<$Res>
    extends _$DynamicFormModelCopyWithImpl<$Res, _$DynamicFormModelImpl>
    implements _$$DynamicFormModelImplCopyWith<$Res> {
  __$$DynamicFormModelImplCopyWithImpl(_$DynamicFormModelImpl _value,
      $Res Function(_$DynamicFormModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formName = null,
    Object? fields = null,
  }) {
    return _then(_$DynamicFormModelImpl(
      formName: null == formName
          ? _value.formName
          : formName // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<Field>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DynamicFormModelImpl implements _DynamicFormModel {
  const _$DynamicFormModelImpl(
      {@JsonKey(name: 'form_name') required this.formName,
      required final List<Field> fields})
      : _fields = fields;

  factory _$DynamicFormModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DynamicFormModelImplFromJson(json);

  @override
  @JsonKey(name: 'form_name')
  final String formName;
  final List<Field> _fields;
  @override
  List<Field> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  String toString() {
    return 'DynamicFormModel(formName: $formName, fields: $fields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DynamicFormModelImpl &&
            (identical(other.formName, formName) ||
                other.formName == formName) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, formName, const DeepCollectionEquality().hash(_fields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DynamicFormModelImplCopyWith<_$DynamicFormModelImpl> get copyWith =>
      __$$DynamicFormModelImplCopyWithImpl<_$DynamicFormModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DynamicFormModelImplToJson(
      this,
    );
  }
}

abstract class _DynamicFormModel implements DynamicFormModel {
  const factory _DynamicFormModel(
      {@JsonKey(name: 'form_name') required final String formName,
      required final List<Field> fields}) = _$DynamicFormModelImpl;

  factory _DynamicFormModel.fromJson(Map<String, dynamic> json) =
      _$DynamicFormModelImpl.fromJson;

  @override
  @JsonKey(name: 'form_name')
  String get formName;
  @override
  List<Field> get fields;
  @override
  @JsonKey(ignore: true)
  _$$DynamicFormModelImplCopyWith<_$DynamicFormModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Field _$FieldFromJson(Map<String, dynamic> json) {
  return _Field.fromJson(json);
}

/// @nodoc
mixin _$Field {
  @JsonKey(name: 'component_type')
  String get componentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta_info')
  MetaInfo get metaInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldCopyWith<Field> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldCopyWith<$Res> {
  factory $FieldCopyWith(Field value, $Res Function(Field) then) =
      _$FieldCopyWithImpl<$Res, Field>;
  @useResult
  $Res call(
      {@JsonKey(name: 'component_type') String componentType,
      @JsonKey(name: 'meta_info') MetaInfo metaInfo});

  $MetaInfoCopyWith<$Res> get metaInfo;
}

/// @nodoc
class _$FieldCopyWithImpl<$Res, $Val extends Field>
    implements $FieldCopyWith<$Res> {
  _$FieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? componentType = null,
    Object? metaInfo = null,
  }) {
    return _then(_value.copyWith(
      componentType: null == componentType
          ? _value.componentType
          : componentType // ignore: cast_nullable_to_non_nullable
              as String,
      metaInfo: null == metaInfo
          ? _value.metaInfo
          : metaInfo // ignore: cast_nullable_to_non_nullable
              as MetaInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaInfoCopyWith<$Res> get metaInfo {
    return $MetaInfoCopyWith<$Res>(_value.metaInfo, (value) {
      return _then(_value.copyWith(metaInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FieldImplCopyWith<$Res> implements $FieldCopyWith<$Res> {
  factory _$$FieldImplCopyWith(
          _$FieldImpl value, $Res Function(_$FieldImpl) then) =
      __$$FieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'component_type') String componentType,
      @JsonKey(name: 'meta_info') MetaInfo metaInfo});

  @override
  $MetaInfoCopyWith<$Res> get metaInfo;
}

/// @nodoc
class __$$FieldImplCopyWithImpl<$Res>
    extends _$FieldCopyWithImpl<$Res, _$FieldImpl>
    implements _$$FieldImplCopyWith<$Res> {
  __$$FieldImplCopyWithImpl(
      _$FieldImpl _value, $Res Function(_$FieldImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? componentType = null,
    Object? metaInfo = null,
  }) {
    return _then(_$FieldImpl(
      componentType: null == componentType
          ? _value.componentType
          : componentType // ignore: cast_nullable_to_non_nullable
              as String,
      metaInfo: null == metaInfo
          ? _value.metaInfo
          : metaInfo // ignore: cast_nullable_to_non_nullable
              as MetaInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FieldImpl implements _Field {
  const _$FieldImpl(
      {@JsonKey(name: 'component_type') required this.componentType,
      @JsonKey(name: 'meta_info') required this.metaInfo});

  factory _$FieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$FieldImplFromJson(json);

  @override
  @JsonKey(name: 'component_type')
  final String componentType;
  @override
  @JsonKey(name: 'meta_info')
  final MetaInfo metaInfo;

  @override
  String toString() {
    return 'Field(componentType: $componentType, metaInfo: $metaInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldImpl &&
            (identical(other.componentType, componentType) ||
                other.componentType == componentType) &&
            (identical(other.metaInfo, metaInfo) ||
                other.metaInfo == metaInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, componentType, metaInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldImplCopyWith<_$FieldImpl> get copyWith =>
      __$$FieldImplCopyWithImpl<_$FieldImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FieldImplToJson(
      this,
    );
  }
}

abstract class _Field implements Field {
  const factory _Field(
          {@JsonKey(name: 'component_type') required final String componentType,
          @JsonKey(name: 'meta_info') required final MetaInfo metaInfo}) =
      _$FieldImpl;

  factory _Field.fromJson(Map<String, dynamic> json) = _$FieldImpl.fromJson;

  @override
  @JsonKey(name: 'component_type')
  String get componentType;
  @override
  @JsonKey(name: 'meta_info')
  MetaInfo get metaInfo;
  @override
  @JsonKey(ignore: true)
  _$$FieldImplCopyWith<_$FieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetaInfo _$MetaInfoFromJson(Map<String, dynamic> json) {
  return _MetaInfo.fromJson(json);
}

/// @nodoc
mixin _$MetaInfo {
  String get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'component_input_type')
  String? get componentInputType => throw _privateConstructorUsedError;
  String get mandatory => throw _privateConstructorUsedError;
  List<String>? get options => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_of_images_to_capture')
  int? get noOfImagesToCapture => throw _privateConstructorUsedError;
  @JsonKey(name: 'saving_folder')
  String? get savingFolder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaInfoCopyWith<MetaInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaInfoCopyWith<$Res> {
  factory $MetaInfoCopyWith(MetaInfo value, $Res Function(MetaInfo) then) =
      _$MetaInfoCopyWithImpl<$Res, MetaInfo>;
  @useResult
  $Res call(
      {String label,
      @JsonKey(name: 'component_input_type') String? componentInputType,
      String mandatory,
      List<String>? options,
      @JsonKey(name: 'no_of_images_to_capture') int? noOfImagesToCapture,
      @JsonKey(name: 'saving_folder') String? savingFolder});
}

/// @nodoc
class _$MetaInfoCopyWithImpl<$Res, $Val extends MetaInfo>
    implements $MetaInfoCopyWith<$Res> {
  _$MetaInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? componentInputType = freezed,
    Object? mandatory = null,
    Object? options = freezed,
    Object? noOfImagesToCapture = freezed,
    Object? savingFolder = freezed,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      componentInputType: freezed == componentInputType
          ? _value.componentInputType
          : componentInputType // ignore: cast_nullable_to_non_nullable
              as String?,
      mandatory: null == mandatory
          ? _value.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as String,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      noOfImagesToCapture: freezed == noOfImagesToCapture
          ? _value.noOfImagesToCapture
          : noOfImagesToCapture // ignore: cast_nullable_to_non_nullable
              as int?,
      savingFolder: freezed == savingFolder
          ? _value.savingFolder
          : savingFolder // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaInfoImplCopyWith<$Res>
    implements $MetaInfoCopyWith<$Res> {
  factory _$$MetaInfoImplCopyWith(
          _$MetaInfoImpl value, $Res Function(_$MetaInfoImpl) then) =
      __$$MetaInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label,
      @JsonKey(name: 'component_input_type') String? componentInputType,
      String mandatory,
      List<String>? options,
      @JsonKey(name: 'no_of_images_to_capture') int? noOfImagesToCapture,
      @JsonKey(name: 'saving_folder') String? savingFolder});
}

/// @nodoc
class __$$MetaInfoImplCopyWithImpl<$Res>
    extends _$MetaInfoCopyWithImpl<$Res, _$MetaInfoImpl>
    implements _$$MetaInfoImplCopyWith<$Res> {
  __$$MetaInfoImplCopyWithImpl(
      _$MetaInfoImpl _value, $Res Function(_$MetaInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? componentInputType = freezed,
    Object? mandatory = null,
    Object? options = freezed,
    Object? noOfImagesToCapture = freezed,
    Object? savingFolder = freezed,
  }) {
    return _then(_$MetaInfoImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      componentInputType: freezed == componentInputType
          ? _value.componentInputType
          : componentInputType // ignore: cast_nullable_to_non_nullable
              as String?,
      mandatory: null == mandatory
          ? _value.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as String,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      noOfImagesToCapture: freezed == noOfImagesToCapture
          ? _value.noOfImagesToCapture
          : noOfImagesToCapture // ignore: cast_nullable_to_non_nullable
              as int?,
      savingFolder: freezed == savingFolder
          ? _value.savingFolder
          : savingFolder // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaInfoImpl implements _MetaInfo {
  const _$MetaInfoImpl(
      {required this.label,
      @JsonKey(name: 'component_input_type') this.componentInputType,
      required this.mandatory,
      final List<String>? options,
      @JsonKey(name: 'no_of_images_to_capture') this.noOfImagesToCapture,
      @JsonKey(name: 'saving_folder') this.savingFolder})
      : _options = options;

  factory _$MetaInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaInfoImplFromJson(json);

  @override
  final String label;
  @override
  @JsonKey(name: 'component_input_type')
  final String? componentInputType;
  @override
  final String mandatory;
  final List<String>? _options;
  @override
  List<String>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'no_of_images_to_capture')
  final int? noOfImagesToCapture;
  @override
  @JsonKey(name: 'saving_folder')
  final String? savingFolder;

  @override
  String toString() {
    return 'MetaInfo(label: $label, componentInputType: $componentInputType, mandatory: $mandatory, options: $options, noOfImagesToCapture: $noOfImagesToCapture, savingFolder: $savingFolder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaInfoImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.componentInputType, componentInputType) ||
                other.componentInputType == componentInputType) &&
            (identical(other.mandatory, mandatory) ||
                other.mandatory == mandatory) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.noOfImagesToCapture, noOfImagesToCapture) ||
                other.noOfImagesToCapture == noOfImagesToCapture) &&
            (identical(other.savingFolder, savingFolder) ||
                other.savingFolder == savingFolder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      label,
      componentInputType,
      mandatory,
      const DeepCollectionEquality().hash(_options),
      noOfImagesToCapture,
      savingFolder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaInfoImplCopyWith<_$MetaInfoImpl> get copyWith =>
      __$$MetaInfoImplCopyWithImpl<_$MetaInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaInfoImplToJson(
      this,
    );
  }
}

abstract class _MetaInfo implements MetaInfo {
  const factory _MetaInfo(
      {required final String label,
      @JsonKey(name: 'component_input_type') final String? componentInputType,
      required final String mandatory,
      final List<String>? options,
      @JsonKey(name: 'no_of_images_to_capture') final int? noOfImagesToCapture,
      @JsonKey(name: 'saving_folder')
      final String? savingFolder}) = _$MetaInfoImpl;

  factory _MetaInfo.fromJson(Map<String, dynamic> json) =
      _$MetaInfoImpl.fromJson;

  @override
  String get label;
  @override
  @JsonKey(name: 'component_input_type')
  String? get componentInputType;
  @override
  String get mandatory;
  @override
  List<String>? get options;
  @override
  @JsonKey(name: 'no_of_images_to_capture')
  int? get noOfImagesToCapture;
  @override
  @JsonKey(name: 'saving_folder')
  String? get savingFolder;
  @override
  @JsonKey(ignore: true)
  _$$MetaInfoImplCopyWith<_$MetaInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
