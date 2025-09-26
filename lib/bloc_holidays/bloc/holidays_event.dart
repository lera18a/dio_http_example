part of 'holidays_bloc.dart';

sealed class HolidaysEvent {}

class DropDownCountryEvent extends HolidaysEvent {
  final String? selectedCountry;

  DropDownCountryEvent({required this.selectedCountry});
}

class DropDownMonthEvent extends HolidaysEvent {
  final int? selectedMonth;

  DropDownMonthEvent({required this.selectedMonth});
}

class DropDownTypeEvent extends HolidaysEvent {
  final HolidayType? selectedType;

  DropDownTypeEvent({required this.selectedType});
}

class DropDownYearEvent extends HolidaysEvent {
  final int? selectedYear;

  DropDownYearEvent({required this.selectedYear});
}

class HolidaysButtonEvent extends HolidaysEvent {}

class LoadingCountryListEvent extends HolidaysEvent {}
