// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_holidays_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiHolidaysResponse _$ApiHolidaysResponseFromJson(Map<String, dynamic> json) =>
    ApiHolidaysResponse(
      holidays: (json['holidays'] as List<dynamic>)
          .map((e) => ApiHoliday.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiHolidaysResponseToJson(
  ApiHolidaysResponse instance,
) => <String, dynamic>{'holidays': instance.holidays};
