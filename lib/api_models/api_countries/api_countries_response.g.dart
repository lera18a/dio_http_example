// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_countries_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiCountriesResponse _$ApiCountriesResponseFromJson(
  Map<String, dynamic> json,
) => ApiCountriesResponse(
  url: json['url'] as String,
  countries: (json['countries'] as List<dynamic>)
      .map((e) => ApiCountry.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ApiCountriesResponseToJson(
  ApiCountriesResponse instance,
) => <String, dynamic>{'url': instance.url, 'countries': instance.countries};
