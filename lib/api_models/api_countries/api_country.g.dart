// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiCountry _$ApiCountryFromJson(Map<String, dynamic> json) => ApiCountry(
  countryName: json['country_name'] as String,
  iso3166: json['iso-3166'] as String,
  totalHolidays: (json['total_holidays'] as num?)?.toInt(),
  supportedLanguages: (json['supported_languages'] as num).toInt(),
  uuid: json['uuid'] as String,
  flagUnicode: json['flag_unicode'] as String?,
);

Map<String, dynamic> _$ApiCountryToJson(ApiCountry instance) =>
    <String, dynamic>{
      'country_name': instance.countryName,
      'iso-3166': instance.iso3166,
      'total_holidays': instance.totalHolidays,
      'supported_languages': instance.supportedLanguages,
      'uuid': instance.uuid,
      'flag_unicode': instance.flagUnicode,
    };
