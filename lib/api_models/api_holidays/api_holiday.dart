import 'package:dio_http_example/api_models/api_holidays/api_country_holidays.dart';
import 'package:json_annotation/json_annotation.dart';

import 'api_holiday_date/api_holiday_date.dart';

part 'api_holiday.g.dart';

@JsonSerializable()
class ApiHoliday {
  final String name;
  final String description;
  final ApiCountryHolidays country;
  final ApiHolidayDate date;
  final List<String> type;
  ApiHoliday({
    required this.date,
    required this.type,
    required this.name,
    required this.description,
    required this.country,
  });
  factory ApiHoliday.fromJson(Map<String, dynamic> json) =>
      _$ApiHolidayFromJson(json);

  Map<String, dynamic> toJson() => _$ApiHolidayToJson(this);
}
