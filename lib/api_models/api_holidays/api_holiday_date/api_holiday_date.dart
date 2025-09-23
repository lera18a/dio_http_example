import 'package:dio_http_example/api_models/api_holidays/api_holiday_date/api_holiday_datetime.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_holiday_date.g.dart';

@JsonSerializable()
class ApiHolidayDate {
  final String iso;
  final ApiHolidayDatetime datetime;

  ApiHolidayDate({required this.iso, required this.datetime});
  factory ApiHolidayDate.fromJson(Map<String, dynamic> json) =>
      _$ApiHolidayDateFromJson(json);

  Map<String, dynamic> toJson() => _$ApiHolidayDateToJson(this);
}
