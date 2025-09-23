// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_meta_holidays_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiMetaHolidayResponse _$ApiMetaHolidayResponseFromJson(
  Map<String, dynamic> json,
) => ApiMetaHolidayResponse(
  meta: ApiMeta.fromJson(json['meta'] as Map<String, dynamic>),
  response: ApiHolidaysResponse.fromJson(
    json['response'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ApiMetaHolidayResponseToJson(
  ApiMetaHolidayResponse instance,
) => <String, dynamic>{'meta': instance.meta, 'response': instance.response};
