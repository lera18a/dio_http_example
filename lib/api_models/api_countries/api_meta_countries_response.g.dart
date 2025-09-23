// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_meta_countries_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiMetaCountriesResponse _$ApiMetaCountriesResponseFromJson(
  Map<String, dynamic> json,
) => ApiMetaCountriesResponse(
  meta: ApiMeta.fromJson(json['meta'] as Map<String, dynamic>),
  response: ApiCountriesResponse.fromJson(
    json['response'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ApiMetaCountriesResponseToJson(
  ApiMetaCountriesResponse instance,
) => <String, dynamic>{'meta': instance.meta, 'response': instance.response};
