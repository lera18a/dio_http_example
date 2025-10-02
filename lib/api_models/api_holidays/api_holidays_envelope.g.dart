// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_holidays_envelope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiHolidaysEnvelope _$ApiHolidaysEnvelopeFromJson(Map<String, dynamic> json) =>
    ApiHolidaysEnvelope(
      response: ApiHolidaysResponse.fromJson(
        json['response'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ApiHolidaysEnvelopeToJson(
  ApiHolidaysEnvelope instance,
) => <String, dynamic>{'response': instance.response};
