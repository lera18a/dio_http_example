import 'package:dio_http_example/api_key.dart';
import 'package:dio_http_example/api_models/api_holidays/api_holiday.dart';
import 'package:dio_http_example/ui/dropdowns/dropdown_country_page.dart';
import 'package:dio_http_example/ui/dropdowns/dropdown_month_page.dart';
import 'package:dio_http_example/ui/ui_models/dropdown_model.dart';
import 'package:dio_http_example/list.dart';
import 'package:dio_http_example/ui/ui_models/list_view_model.dart';
import 'package:flutter/material.dart';
import '../api_models/api_countries/api_country.dart';
import '../api_models/api_holidays/api_holiday_type/holiday_type.dart';
import '../holidays_api_dio_client.dart';
import 'dropdowns/dropdown_type_page.dart';
import 'dropdowns/dropdown_year_page.dart';
import 'ui_models/holidays_button.dart';

class GlobalUIPage extends StatefulWidget {
  const GlobalUIPage({super.key});

  @override
  State<GlobalUIPage> createState() => _GlobalUIPageState();
}

class _GlobalUIPageState extends State<GlobalUIPage> {
  List<ApiHoliday>? holidaysList;
  List<ApiCountry>? countryList;
  List<HolidayType>? typesList;
  HolidaysApiDioClient apiClient = HolidaysApiDioClient(
    apiKey: apiKey,
    host: 'https://calendarific.com/api/v2',
  );
  String? selectedCountry;
  int? selectedYear;
  int? selectedMonth;
  HolidayType? selectedType;

  @override
  void initState() {
    super.initState();
    apiClient
        .getCountries()
        .then((value) => countryList = value.response.countries)
        .then((_) => setState(() {}));
    typesList = HolidayType.values;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropDownCountryPage(),
            DropDownYearPage(),
            DropDowmMonthPage(),
            DropDownTypePage(),
            HolidaysButton(
              onPressed: () async {
                if (selectedCountry != null && selectedYear != null) {
                  final response = await apiClient.getHolidays(
                    country: selectedCountry!,
                    year: selectedYear!,
                    month: selectedMonth,
                    type: selectedType,
                  );
                  holidaysList = response.response.holidays;
                  setState(() {});
                }
              },
            ),
            SizedBox(height: 20),
            if (holidaysList != null)
              Expanded(child: ListViewModel(holidaysList: holidaysList!)),
          ],
        ),
      ),
    );
  }
}
