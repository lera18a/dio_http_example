import 'package:json_annotation/json_annotation.dart';

part 'api_holiday_datetime.g.dart';

@JsonSerializable()
class ApiHolidayDatetime {
  final int year;
  final int? month;
  final int? day;

  ApiHolidayDatetime({
    required this.year,
    required this.month,
    required this.day,
  });
  factory ApiHolidayDatetime.fromJson(Map<String, dynamic> json) =>
      _$ApiHolidayDatetimeFromJson(json);

  Map<String, dynamic> toJson() => _$ApiHolidayDatetimeToJson(this);
}
