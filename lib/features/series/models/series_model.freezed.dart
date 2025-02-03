// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SerieTV _$SerieTVFromJson(Map<String, dynamic> json) {
  return _SerieTV.fromJson(json);
}

/// @nodoc
mixin _$SerieTV {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get poster_path => throw _privateConstructorUsedError;
  String get original_language => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  double get vote_average => throw _privateConstructorUsedError;
  bool get adult => throw _privateConstructorUsedError;

  /// Serializes this SerieTV to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SerieTV
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SerieTVCopyWith<SerieTV> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SerieTVCopyWith<$Res> {
  factory $SerieTVCopyWith(SerieTV value, $Res Function(SerieTV) then) =
      _$SerieTVCopyWithImpl<$Res, SerieTV>;
  @useResult
  $Res call(
      {int id,
      String name,
      String poster_path,
      String original_language,
      String overview,
      double vote_average,
      bool adult});
}

/// @nodoc
class _$SerieTVCopyWithImpl<$Res, $Val extends SerieTV>
    implements $SerieTVCopyWith<$Res> {
  _$SerieTVCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SerieTV
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? poster_path = null,
    Object? original_language = null,
    Object? overview = null,
    Object? vote_average = null,
    Object? adult = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      poster_path: null == poster_path
          ? _value.poster_path
          : poster_path // ignore: cast_nullable_to_non_nullable
              as String,
      original_language: null == original_language
          ? _value.original_language
          : original_language // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      vote_average: null == vote_average
          ? _value.vote_average
          : vote_average // ignore: cast_nullable_to_non_nullable
              as double,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SerieTVImplCopyWith<$Res> implements $SerieTVCopyWith<$Res> {
  factory _$$SerieTVImplCopyWith(
          _$SerieTVImpl value, $Res Function(_$SerieTVImpl) then) =
      __$$SerieTVImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String poster_path,
      String original_language,
      String overview,
      double vote_average,
      bool adult});
}

/// @nodoc
class __$$SerieTVImplCopyWithImpl<$Res>
    extends _$SerieTVCopyWithImpl<$Res, _$SerieTVImpl>
    implements _$$SerieTVImplCopyWith<$Res> {
  __$$SerieTVImplCopyWithImpl(
      _$SerieTVImpl _value, $Res Function(_$SerieTVImpl) _then)
      : super(_value, _then);

  /// Create a copy of SerieTV
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? poster_path = null,
    Object? original_language = null,
    Object? overview = null,
    Object? vote_average = null,
    Object? adult = null,
  }) {
    return _then(_$SerieTVImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      poster_path: null == poster_path
          ? _value.poster_path
          : poster_path // ignore: cast_nullable_to_non_nullable
              as String,
      original_language: null == original_language
          ? _value.original_language
          : original_language // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      vote_average: null == vote_average
          ? _value.vote_average
          : vote_average // ignore: cast_nullable_to_non_nullable
              as double,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SerieTVImpl implements _SerieTV {
  const _$SerieTVImpl(
      {required this.id,
      required this.name,
      required this.poster_path,
      required this.original_language,
      required this.overview,
      required this.vote_average,
      required this.adult});

  factory _$SerieTVImpl.fromJson(Map<String, dynamic> json) =>
      _$$SerieTVImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String poster_path;
  @override
  final String original_language;
  @override
  final String overview;
  @override
  final double vote_average;
  @override
  final bool adult;

  @override
  String toString() {
    return 'SerieTV(id: $id, name: $name, poster_path: $poster_path, original_language: $original_language, overview: $overview, vote_average: $vote_average, adult: $adult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SerieTVImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.poster_path, poster_path) ||
                other.poster_path == poster_path) &&
            (identical(other.original_language, original_language) ||
                other.original_language == original_language) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.vote_average, vote_average) ||
                other.vote_average == vote_average) &&
            (identical(other.adult, adult) || other.adult == adult));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, poster_path,
      original_language, overview, vote_average, adult);

  /// Create a copy of SerieTV
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SerieTVImplCopyWith<_$SerieTVImpl> get copyWith =>
      __$$SerieTVImplCopyWithImpl<_$SerieTVImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SerieTVImplToJson(
      this,
    );
  }
}

abstract class _SerieTV implements SerieTV {
  const factory _SerieTV(
      {required final int id,
      required final String name,
      required final String poster_path,
      required final String original_language,
      required final String overview,
      required final double vote_average,
      required final bool adult}) = _$SerieTVImpl;

  factory _SerieTV.fromJson(Map<String, dynamic> json) = _$SerieTVImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get poster_path;
  @override
  String get original_language;
  @override
  String get overview;
  @override
  double get vote_average;
  @override
  bool get adult;

  /// Create a copy of SerieTV
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SerieTVImplCopyWith<_$SerieTVImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
