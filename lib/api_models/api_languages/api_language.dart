import 'package:json_annotation/json_annotation.dart';

part 'api_language.g.dart';

@JsonSerializable()
class ApiLanguage {
  final String code;
  final String name;
  final String nativeName;

  ApiLanguage({
    required this.code,
    required this.name,
    required this.nativeName,
  });

  factory ApiLanguage.fromJson(Map<String, dynamic> json) =>
      _$ApiLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$ApiLanguageToJson(this);
}
