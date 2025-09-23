// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_holiday_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiHolidayDate _$ApiHolidayDateFromJson(Map<String, dynamic> json) =>
    ApiHolidayDate(
      iso: json['iso'] as String,
      datetime: ApiHolidayDatetime.fromJson(
        json['datetime'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ApiHolidayDateToJson(ApiHolidayDate instance) =>
    <String, dynamic>{'iso': instance.iso, 'datetime': instance.datetime};
