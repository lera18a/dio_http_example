import 'package:dio_http_example/api_models/api_holidays/api_holidays_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_holidays_envelope.g.dart';

@JsonSerializable()
class ApiHolidaysEnvelope {
  final ApiHolidaysResponse response;

  ApiHolidaysEnvelope({required this.response});

  factory ApiHolidaysEnvelope.fromJson(Map<String, dynamic> json) =>
      _$ApiHolidaysEnvelopeFromJson(json);

  Map<String, dynamic> toJson() => _$ApiHolidaysEnvelopeToJson(this);
}
