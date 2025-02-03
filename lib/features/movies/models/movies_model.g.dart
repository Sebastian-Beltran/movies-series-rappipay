// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      poster_path: json['poster_path'] as String?,
      original_language: json['original_language'] as String,
      overview: json['overview'] as String,
      vote_average: (json['vote_average'] as num).toDouble(),
      adult: json['adult'] as bool,
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.poster_path,
      'original_language': instance.original_language,
      'overview': instance.overview,
      'vote_average': instance.vote_average,
      'adult': instance.adult,
    };
