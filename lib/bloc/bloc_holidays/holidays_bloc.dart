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
    on<ClearHolidaysEvent>(_onClearHolidaysEvent);
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
      HolidaysState(
        stateMonth: state.stateMonth,
        stateType: state.stateType,
        stateYear: state.stateYear,
        stateCountry: event.selectedCountry,
        stateHolidaysList: [],
        isLoading: false,
        countryList: state.countryList,
        error: null,
      ),
    );
  }

  void _onDropDownYearEvent(
    DropDownYearEvent event,
    Emitter<HolidaysState> emit,
  ) {
    emit(
      HolidaysState(
        stateMonth: state.stateMonth,
        stateType: state.stateType,
        stateYear: event.selectedYear,
        stateCountry: state.stateCountry,
        stateHolidaysList: [],
        isLoading: false,
        countryList: state.countryList,
        error: state.error,
      ),
    );
  }

  void _onDropDownMonthEvent(
    DropDownMonthEvent event,
    Emitter<HolidaysState> emit,
  ) {
    emit(
      HolidaysState(
        stateMonth: event.selectedMonth,
        stateType: state.stateType,
        stateYear: state.stateYear,
        stateCountry: state.stateCountry,
        stateHolidaysList: [],
        isLoading: false,
        countryList: state.countryList,
        error: state.error,
      ),
    );
  }

  void _onDropDownTypeEvent(
    DropDownTypeEvent event,
    Emitter<HolidaysState> emit,
  ) {
    emit(HolidaysState(stateType: event.selectedType, stateHolidaysList: []));
  }

  Future<void> _onHolidaysButtonEvent(
    HolidaysButtonEvent event,
    Emitter<HolidaysState> emit,
  ) async {
    if (state.stateCountry == null || state.stateYear == null) {
      emit(
        HolidaysState(
          stateMonth: state.stateMonth,
          stateType: state.stateType,
          stateYear: state.stateYear,
          stateCountry: state.stateCountry,
          stateHolidaysList: [],
          isLoading: false,
          countryList: state.countryList,
          error: 'Выберите страну и год',
        ),
      );
      return;
    }
    emit(
      HolidaysState(
        stateMonth: state.stateMonth,
        stateType: state.stateType,
        stateYear: state.stateYear,
        stateCountry: state.stateCountry,
        stateHolidaysList: [],
        isLoading: true,
        countryList: state.countryList,
        error: null,
      ),
    );
    try {
      final envelope = await apiClient.getHolidays(
        country: state.stateCountry!,
        year: state.stateYear!,
        month: state.stateMonth,
        type: state.stateType,
      );
      final holidayList = envelope.response.holidays;
      emit(
        HolidaysState(
          stateMonth: state.stateMonth,
          stateType: state.stateType,
          stateYear: state.stateYear,
          stateCountry: state.stateCountry,
          countryList: state.countryList,
          stateHolidaysList: holidayList,
          isLoading: false,
          error: null,
        ),
      );
    } catch (e) {
      print('🚫 ОШИБКА ЗАГРУЗКИ% $e');
      emit(
        HolidaysState(
          stateMonth: state.stateMonth,
          stateType: state.stateType,
          stateYear: state.stateYear,
          stateCountry: state.stateCountry,
          countryList: state.countryList,
          stateHolidaysList: state.stateHolidaysList,
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
    emit(
      HolidaysState(
        stateMonth: state.stateMonth,
        stateType: state.stateType,
        stateYear: state.stateYear,
        stateCountry: state.stateCountry,
        countryList: state.countryList,
        stateHolidaysList: state.stateHolidaysList,
        error: null,
        isLoading: true,
      ),
    );
    try {
      final response = await apiClient.getCountries();
      print('✅ Загружено ${response.response.countries.length} стран');
      emit(
        HolidaysState(
          stateMonth: state.stateMonth,
          stateType: state.stateType,
          stateYear: state.stateYear,
          stateCountry: state.stateCountry,
          countryList: response.response.countries,
          stateHolidaysList: state.stateHolidaysList,
          error: null,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        HolidaysState(
          stateMonth: state.stateMonth,
          stateType: state.stateType,
          stateYear: state.stateYear,
          stateCountry: state.stateCountry,
          countryList: state.countryList,
          stateHolidaysList: state.stateHolidaysList,
          isLoading: false,
          error: 'Страны не загрузились (ошибка)',
        ),
      );
    }
  }

  void _onClearHolidaysEvent(
    ClearHolidaysEvent event,
    Emitter<HolidaysState> emit,
  ) {
    emit(
      HolidaysState(
        stateMonth: null,
        stateType: null,
        stateYear: null,
        stateCountry: null,
        stateHolidaysList: [],
        isLoading: false,
        countryList: state.countryList,
        error: null,
      ),
    );
  }
}
