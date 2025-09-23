import 'package:dio_http_example/api_models/api_countries/api_country.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_countries_response.g.dart';

@JsonSerializable()
class ApiCountriesResponse {
  final String url;
  final List<ApiCountry> countries;

  ApiCountriesResponse({required this.url, required this.countries});

  factory ApiCountriesResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiCountriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiCountriesResponseToJson(this);
}
