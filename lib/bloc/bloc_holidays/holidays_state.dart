part of 'holidays_bloc.dart';

class HolidaysState {
  final String? stateCountry;
  final int? stateMonth;
  final HolidayType? stateType;
  final int? stateYear;
  final List<ApiHoliday> stateHolidaysList;
  final List<ApiCountry>? countryList;
  final bool isLoading;
  final String? error;

  HolidaysState({
    this.stateCountry,
    this.stateMonth,
    this.stateType,
    this.stateYear,
    this.stateHolidaysList = const [],
    this.isLoading = false,
    this.countryList,
    this.error,
  });
}
