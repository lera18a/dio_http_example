import 'package:dio_http_example/bloc/bloc_holidays/holidays_bloc.dart';
import 'package:dio_http_example/bloc/bloc_theme/theme_bloc.dart';
import 'package:dio_http_example/ui/dropdowns/dropdown_country_page.dart';
import 'package:dio_http_example/ui/dropdowns/dropdown_month_page.dart';
import 'package:dio_http_example/ui/ui_pages/holidays_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api_models/api_holidays/api_holiday_type/holiday_type.dart';
import '../dropdowns/dropdown_type_page.dart';
import '../dropdowns/dropdown_year_page.dart';
import '../global_ui_appbar/icons/assets_icon.dart';
import '../search_holidays_button.dart';

class GlobalUIPage extends StatelessWidget {
  const GlobalUIPage({super.key});
  static const searchButtomKey = 'search_buttom';
  static const countryDropDownKey = 'country_drop_down';
  static const yearDropDownKey = 'year_drop_down';
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) => context.read<HolidaysBloc>().add(LoadingCountryListEvent()),
    // );
    final theme = Theme.of(context);
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('API Holidays'), actions: [AssetsIcon()]),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: BlocConsumer<HolidaysBloc, HolidaysState>(
                listener: (context, state) {
                  if (state.error != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Center(
                          child: Text(
                            state.error!,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ),
                    );
                  }
                  if (state.stateHolidaysList.isNotEmpty && !state.isLoading) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HolidaysViewPage(),
                      ),
                    ).then((_) {
                      if (context.mounted) {
                        context.read<HolidaysBloc>().add(ClearHolidaysEvent());
                      }
                    });
                  }
                },
                builder: (context, state) {
                  if (state.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DropDownCountryPage(
                        key: Key(countryDropDownKey),
                        onCountrySelected: (String country) {
                          context.read<HolidaysBloc>().add(
                            DropDownCountryEvent(selectedCountry: country),
                          );
                        },
                        countryList: state.countryList ?? [],
                      ),
                      DropDownYearPage(
                        key: Key(yearDropDownKey),
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
                      Spacer(),
                      SearchHolidaysButton(
                        key: Key(searchButtomKey),
                        onPressed: () {
                          context.read<HolidaysBloc>().add(
                            HolidaysButtonEvent(),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
