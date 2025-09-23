// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_languages_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiLanguagesResponse _$ApiLanguagesResponseFromJson(
  Map<String, dynamic> json,
) => ApiLanguagesResponse(
  url: json['url'] as String,
  languages: (json['languages'] as List<dynamic>)
      .map((e) => ApiLanguage.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ApiLanguagesResponseToJson(
  ApiLanguagesResponse instance,
) => <String, dynamic>{'url': instance.url, 'languages': instance.languages};
