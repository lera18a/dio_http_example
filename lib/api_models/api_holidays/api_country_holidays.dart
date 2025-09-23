import 'package:json_annotation/json_annotation.dart';

part 'api_country_holidays.g.dart';

@JsonSerializable()
class ApiCountryHolidays {
  final String id;
  final String name;

  ApiCountryHolidays({required this.id, required this.name});
  factory ApiCountryHolidays.fromJson(Map<String, dynamic> json) =>
      _$ApiCountryHolidaysFromJson(json);

  Map<String, dynamic> toJson() => _$ApiCountryHolidaysToJson(this);
}
