// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SerieTVImpl _$$SerieTVImplFromJson(Map<String, dynamic> json) =>
    _$SerieTVImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      poster_path: json['poster_path'] as String,
      original_language: json['original_language'] as String,
      overview: json['overview'] as String,
      vote_average: (json['vote_average'] as num).toDouble(),
      adult: json['adult'] as bool,
    );

Map<String, dynamic> _$$SerieTVImplToJson(_$SerieTVImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'poster_path': instance.poster_path,
      'original_language': instance.original_language,
      'overview': instance.overview,
      'vote_average': instance.vote_average,
      'adult': instance.adult,
    };
