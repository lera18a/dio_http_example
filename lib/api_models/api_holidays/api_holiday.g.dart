// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_holiday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiHoliday _$ApiHolidayFromJson(Map<String, dynamic> json) => ApiHoliday(
  date: ApiHolidayDate.fromJson(json['date'] as Map<String, dynamic>),
  type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
  name: json['name'] as String,
  description: json['description'] as String,
  country: ApiCountryHolidays.fromJson(json['country'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ApiHolidayToJson(ApiHoliday instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'country': instance.country,
      'date': instance.date,
      'type': instance.type,
    };
