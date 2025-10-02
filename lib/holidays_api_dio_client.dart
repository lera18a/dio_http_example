import 'package:dio/dio.dart';
import 'package:dio_http_example/api_models/api_countries/api_meta_countries_response.dart';
import 'package:dio_http_example/api_models/api_holidays/api_holiday_type/holiday_type.dart';
import 'package:dio_http_example/api_models/api_holidays/api_holidays_envelope.dart';

import 'package:dio_http_example/api_models/api_languages/api_meta_languages_response.dart';

class HolidaysApiDioClient {
  final String host;
  final String apiKey;
  late Dio _dio;

  static const _API_KEY_PARAMETER = 'api_key';

  HolidaysApiDioClient({required this.apiKey, required this.host}) {
    _dio = Dio(BaseOptions(baseUrl: host));
  }

  Future<ApiHolidaysEnvelope> getHolidays({
    required String country,
    required int year,
    int? day,
    int? month,
    String? location,
    HolidayType? type,
  }) async {
    try {
      final Response response = await _dio.get(
        '/holidays',
        queryParameters: {
          _API_KEY_PARAMETER: apiKey,
          'year': year,
          'country': country,
          'day': day,
          'month': month,
          'location': location,
          'type': type?.name,
        },
      );
      print('${response.statusCode}');
      print('${response.data}');

      return ApiHolidaysEnvelope.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<ApiMetaLanguagesResponse> getLanguages() async {
    final Response response = await _dio.get(
      '/languages',
      // параметры запроса
      queryParameters: {_API_KEY_PARAMETER: apiKey},
    );
    return ApiMetaLanguagesResponse.fromJson(response.data);
  }

  Future<ApiMetaCountriesResponse> getCountries() async {
    final Response response = await _dio.get(
      '/countries',
      queryParameters: {_API_KEY_PARAMETER: apiKey},
    );
    return ApiMetaCountriesResponse.fromJson(response.data);
  }
}
