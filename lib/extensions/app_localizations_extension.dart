import 'package:dio_http_example/api_models/api_holidays/api_holiday_type/holiday_type.dart';
import 'package:dio_http_example/l10n/app_localizations.dart';

extension AppLocalizationsExtension on AppLocalizations {
  String holidayType(HolidayType type) {
    return switch (type) {
      HolidayType.national => nationalDate,

      HolidayType.local => localHoliday,

      HolidayType.religious => religiousHoliday,

      HolidayType.observance => observance,
    };
  }
}
