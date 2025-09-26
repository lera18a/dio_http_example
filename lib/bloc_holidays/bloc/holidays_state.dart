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

  HolidaysState copyWith({
    String? stateCountry,
    int? stateMonth,
    HolidayType? stateType,
    int? stateYear,
    List<ApiHoliday>? stateHolidaysList,
    List<ApiCountry>? countryList,
    bool? isLoading,
    String? error,
  }) {
    return HolidaysState(
      stateCountry: stateCountry ?? this.stateCountry,
      stateMonth: stateMonth ?? this.stateMonth,
      stateType: stateType ?? this.stateType,
      stateYear: stateYear ?? this.stateYear,
      stateHolidaysList: stateHolidaysList ?? this.stateHolidaysList,
      isLoading: isLoading ?? this.isLoading,
      countryList: countryList ?? this.countryList,
      error: error ?? this.error,
    );
  }
}
