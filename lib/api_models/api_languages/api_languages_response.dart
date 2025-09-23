import 'package:dio_http_example/api_models/api_languages/api_language.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_languages_response.g.dart';

@JsonSerializable()
class ApiLanguagesResponse {
  final String url;
  final List<ApiLanguage> languages;

  ApiLanguagesResponse({required this.url, required this.languages});
  factory ApiLanguagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiLanguagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiLanguagesResponseToJson(this);
}
