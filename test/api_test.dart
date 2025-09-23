import 'package:dio_http_example/api_key.dart';
import 'package:dio_http_example/api_models/api_holidays/api_holiday_type/holiday_type.dart';
import 'package:dio_http_example/holidays_api_dio_client.dart';
import 'package:flutter_test/flutter_test.dart';

final String host = 'https://calendarific.com/api/v2';

void main() {
  final apiClient = HolidaysApiDioClient(apiKey: apiKey, host: host);

  group('Languages group', () {
    test('Get languages', () async {
      final response = await apiClient.getLanguages();
      expect(response.response.languages.isNotEmpty, true);
    });
  });
  group('Countries group', () {
    test('Get countries', () async {
      final response = await apiClient.getCountries();
      expect(response.response.countries.isNotEmpty, true);
    });
  });
  group('Holidays group', () {
    test('Get holidays', () async {
      final response = await apiClient.getHolidays(
        country: 'BY',
        year: 2020,
        type: HolidayType.national,
        month: 12,
      );
      print(response);
    });
  });
  test('Get holidays1', () async {
    final response = await apiClient.getHolidays(
      country: 'BY',
      year: 2020,
      type: HolidayType.national,
      month: 12,
    );
    print(response.response.holidays.first.date.datetime.day);
  });
  test('Get holidays2', () async {
    final response = await apiClient.getHolidays(
      country: 'BY',
      year: 2020,
      type: HolidayType.national,
      month: 12,
    );
    expect(response.response.holidays.first.date.iso.isNotEmpty, true);
  });
}
