import 'package:dio_http_example/api_models/api_holidays/api_holidays_response.dart';
import 'package:dio_http_example/api_models/api_meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_meta_holidays_response.g.dart';

@JsonSerializable()
class ApiMetaHolidayResponse {
  final ApiMeta meta;
  final ApiHolidaysResponse response;

  ApiMetaHolidayResponse({required this.meta, required this.response});
  factory ApiMetaHolidayResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiMetaHolidayResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiMetaHolidayResponseToJson(this);
}
