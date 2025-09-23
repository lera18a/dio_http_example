// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_holiday_datetime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiHolidayDatetime _$ApiHolidayDatetimeFromJson(Map<String, dynamic> json) =>
    ApiHolidayDatetime(
      year: (json['year'] as num).toInt(),
      month: (json['month'] as num?)?.toInt(),
      day: (json['day'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ApiHolidayDatetimeToJson(ApiHolidayDatetime instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
    };
