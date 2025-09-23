import 'package:json_annotation/json_annotation.dart';

part 'api_country.g.dart';

@JsonSerializable()
class ApiCountry {
  @JsonKey(name: 'country_name')
  final String countryName;
  @JsonKey(name: 'iso-3166')
  final String iso3166;
  @JsonKey(name: 'total_holidays')
  final int? totalHolidays;
  @JsonKey(name: 'supported_languages')
  final int supportedLanguages;
  final String uuid;
  @JsonKey(name: 'flag_unicode')
  final String? flagUnicode;

  ApiCountry({
    required this.countryName,
    required this.iso3166,
    required this.totalHolidays,
    required this.supportedLanguages,
    required this.uuid,
    required this.flagUnicode,
  });

  factory ApiCountry.fromJson(Map<String, dynamic> json) =>
      _$ApiCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ApiCountryToJson(this);
}
