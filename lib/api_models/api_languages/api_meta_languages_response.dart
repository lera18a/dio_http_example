import 'package:dio_http_example/api_models/api_languages/api_languages_response.dart';
import 'package:dio_http_example/api_models/api_meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_meta_languages_response.g.dart';

@JsonSerializable()
class ApiMetaLanguagesResponse {
  final ApiMeta meta;
  final ApiLanguagesResponse response;

  ApiMetaLanguagesResponse({required this.meta, required this.response});
  factory ApiMetaLanguagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiMetaLanguagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiMetaLanguagesResponseToJson(this);
}
