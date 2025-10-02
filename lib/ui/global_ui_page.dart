import 'package:dio_http_example/bloc/bloc_holidays/holidays_bloc.dart';
import 'package:dio_http_example/ui/dropdowns/dropdown_country_page.dart';
import 'package:dio_http_example/ui/dropdowns/dropdown_month_page.dart';
import 'package:dio_http_example/ui/ui_models/holidays_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../api_models/api_holidays/api_holiday_type/holiday_type.dart';
import 'dropdowns/dropdown_type_page.dart';
import 'dropdowns/dropdown_year_page.dart';
import '../appbar/icons/assets_icon.dart';
import 'ui_models/holidays_button.dart';

class GlobalUIPage extends StatelessWidget {
  const GlobalUIPage({super.key, required this.onThemeChanged});
  final ValueChanged<bool> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) => context.read<HolidaysBloc>().add(LoadingCountryListEvent()),
    // );
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('API Holidays'),
        actions: [AssetsIcon(onThemeChanged: onThemeChanged)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: BlocConsumer<HolidaysBloc, HolidaysState>(
            listener: (context, state) {
              if (state.error != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.error!,
                      style: theme.textTheme.labelMedium,
                    ),
                  ),
                );
              }
              if (state.stateHolidaysList.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HolidaysViewPage()),
                );
              }
            },
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
