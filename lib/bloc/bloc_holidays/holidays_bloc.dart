import 'package:bloc/bloc.dart';
import '../../api_key.dart';
import '../../api_models/api_countries/api_country.dart';
import '../../api_models/api_holidays/api_holiday.dart';
import '../../api_models/api_holidays/api_holiday_type/holiday_type.dart';
import '../../holidays_api_dio_client.dart';

part 'holidays_event.dart';
part 'holidays_state.dart';

class HolidaysBloc extends Bloc<HolidaysEvent, HolidaysState> {
  HolidaysBloc()
    : super(
        HolidaysState(
          stateCountry: null,
          stateMonth: null,
          stateType: null,
          stateYear: null,
          stateHolidaysList: [],
        ),
      ) {
    on<DropDownCountryEvent>(_onDropDownCountryEvent);
    on<DropDownYearEvent>(_onDropDownYearEvent);
    on<DropDownMonthEvent>(_onDropDownMonthEvent);
    on<DropDownTypeEvent>(_onDropDownTypeEvent);
    on<HolidaysButtonEvent>(_onHolidaysButtonEvent);
    on<LoadingCountryListEvent>(_onLoadingCountryListEvent);
  }

  HolidaysApiDioClient apiClient = HolidaysApiDioClient(
    apiKey: apiKey,
    host: 'https://calendarific.com/api/v2',
  );
  void _onDropDownCountryEvent(
    DropDownCountryEvent event,
    Emitter<HolidaysState> emit,
  ) {
    emit(
      state.copyWith(
        stateCountry: event.selectedCountry,
        stateHolidaysList: [],
      ),
    );
  }

  void _onDropDownYearEvent(
    DropDownYearEvent event,
    Emitter<HolidaysState> emit,
  ) {
    emit(state.copyWith(stateYear: event.selectedYear, stateHolidaysList: []));
  }

  void _onDropDownMonthEvent(
    DropDownMonthEvent event,
    Emitter<HolidaysState> emit,
  ) {
    emit(
      state.copyWith(stateMonth: event.selectedMonth, stateHolidaysList: []),
    );
  }

  void _onDropDownTypeEvent(
    DropDownTypeEvent event,
    Emitter<HolidaysState> emit,
  ) {
    emit(state.copyWith(stateType: event.selectedType, stateHolidaysList: []));
  }

  Future<void> _onHolidaysButtonEvent(
    HolidaysButtonEvent event,
    Emitter<HolidaysState> emit,
  ) async {
    if (state.stateCountry == null || state.stateYear == null) {
      emit(state.copyWith(error: 'Выберите страну и год'));
      return;
    }
    emit(state.copyWith(error: null, isLoading: true, stateHolidaysList: []));
    try {
      final envelope = await apiClient.getHolidays(
        country: state.stateCountry!,
        year: state.stateYear!,
        month: state.stateMonth,
        type: state.stateType,
      );
      final holidayList = envelope.response.holidays;
      emit(
        state.copyWith(
          error: null,
          stateHolidaysList: holidayList,
          isLoading: false,
        ),
      );
    } catch (e) {
      print('🚫 ОШИБКА ЗАГРУЗКИ% $e');
      emit(
        state.copyWith(
          error: 'Праздники не загрузились (ошибка)',
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _onLoadingCountryListEvent(
    LoadingCountryListEvent event,
    Emitter<HolidaysState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await apiClient.getCountries();
      print('✅ Загружено ${response.response.countries.length} стран');
      emit(
        state.copyWith(
          countryList: response.response.countries,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'Страны не загрузились (ошибка)',
        ),
      );
    }
  }
}
