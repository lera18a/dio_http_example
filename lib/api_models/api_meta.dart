import 'package:json_annotation/json_annotation.dart';

part 'api_meta.g.dart';

@JsonSerializable()
class ApiMeta {
  final int code;

  ApiMeta({required this.code});
  factory ApiMeta.fromJson(Map<String, dynamic> json) =>
      _$ApiMetaFromJson(json);

  Map<String, dynamic> toJson() => _$ApiMetaToJson(this);
}
