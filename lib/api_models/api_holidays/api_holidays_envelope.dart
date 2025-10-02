import 'package:dio_http_example/api_models/api_holidays/api_holidays_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_holidays_envelope.g.dart';

@JsonSerializable()
class ApiHolidaysEnvelope {
  @_HolidayResponseConverter()
  final ApiHolidaysResponse response;

  ApiHolidaysEnvelope({required this.response});

  factory ApiHolidaysEnvelope.fromJson(Map<String, dynamic> json) =>
      _$ApiHolidaysEnvelopeFromJson(json);

  Map<String, dynamic> toJson() => _$ApiHolidaysEnvelopeToJson(this);
}

class _HolidayResponseConverter
    implements JsonConverter<ApiHolidaysResponse, dynamic> {
  const _HolidayResponseConverter();
  @override
  ApiHolidaysResponse fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return ApiHolidaysResponse.fromJson(json);
    } else {
      return ApiHolidaysResponse(holidays: []);
    }
  }

  @override
  toJson(ApiHolidaysResponse object) {
    return object.toJson();
  }
}
