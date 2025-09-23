import 'package:dio_http_example/api_models/api_holidays/api_holiday.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_holidays_response.g.dart';

@JsonSerializable()
class ApiHolidaysResponse {
  final List<ApiHoliday> holidays;

  ApiHolidaysResponse({required this.holidays});
  factory ApiHolidaysResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiHolidaysResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiHolidaysResponseToJson(this);
}
