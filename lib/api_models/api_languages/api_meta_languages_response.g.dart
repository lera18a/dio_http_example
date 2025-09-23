// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_meta_languages_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiMetaLanguagesResponse _$ApiMetaLanguagesResponseFromJson(
  Map<String, dynamic> json,
) => ApiMetaLanguagesResponse(
  meta: ApiMeta.fromJson(json['meta'] as Map<String, dynamic>),
  response: ApiLanguagesResponse.fromJson(
    json['response'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ApiMetaLanguagesResponseToJson(
  ApiMetaLanguagesResponse instance,
) => <String, dynamic>{'meta': instance.meta, 'response': instance.response};
