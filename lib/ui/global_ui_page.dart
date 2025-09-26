import 'package:dio_http_example/bloc_holidays/bloc/holidays_bloc.dart';
import 'package:dio_http_example/ui/dropdowns/dropdown_country_page.dart';
import 'package:dio_http_example/ui/dropdowns/dropdown_month_page.dart';
import 'package:dio_http_example/ui/ui_models/list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../api_models/api_holidays/api_holiday_type/holiday_type.dart';
import 'dropdowns/dropdown_type_page.dart';
import 'dropdowns/dropdown_year_page.dart';
import 'ui_models/holidays_button.dart';

class GlobalUIPage extends StatelessWidget {
  const GlobalUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<HolidaysBloc>().add(LoadingCountryListEvent()),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('API Holidays'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: BlocBuilder<HolidaysBloc, HolidaysState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Center(child: CircularProgressIndicator());
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DropDownCountryPage(
                    onCountrySelected: (String country) {
                      context.read<HolidaysBloc>().add(
                        DropDownCountryEvent(selectedCountry: country),
                      );
                    },
                    countryList: state.countryList ?? [],
                  ),
                  DropDownYearPage(
                    onYearSelected: (int isoCode) {
                      context.read<HolidaysBloc>().add(
                        DropDownYearEvent(selectedYear: isoCode),
                      );
                    },
                  ),
                  DropDownMonthPage(
                    onMonthSelected: (int month) {
                      context.read<HolidaysBloc>().add(
                        DropDownMonthEvent(selectedMonth: month),
                      );
                    },
                  ),
                  DropDownTypePage(
                    onTypeSelected: (HolidayType type) {
                      context.read<HolidaysBloc>().add(
                        DropDownTypeEvent(selectedType: type),
                      );
                    },
                    typesList: HolidayType.values.toList(),
                  ),
                  HolidaysButton(
                    onPressed: () {
                      context.read<HolidaysBloc>().add(HolidaysButtonEvent());
                    },
                  ),
                  SizedBox(height: 20),
                  if (state.error != null)
                    Text(
                      state.error!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  if (state.stateHolidaysList.isNotEmpty)
                    Expanded(
                      child: ListViewModel(
                        holidaysList: state.stateHolidaysList,
                      ),
                    ),
                  if (!state.isLoading &&
                      state.stateHolidaysList.isEmpty &&
                      state.stateCountry != null &&
                      state.stateYear != null)
                    Text(
                      'Праздники не найдены',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
