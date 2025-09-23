import 'package:json_annotation/json_annotation.dart';

import '../api_meta.dart';
import 'api_countries_response.dart';
part 'api_meta_countries_response.g.dart';

@JsonSerializable()
class ApiMetaCountriesResponse {
  final ApiMeta meta;
  final ApiCountriesResponse response;

  ApiMetaCountriesResponse({required this.meta, required this.response});

  factory ApiMetaCountriesResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiMetaCountriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiMetaCountriesResponseToJson(this);
}
