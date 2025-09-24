import 'package:dio_http_example/api_key.dart';
import 'package:dio_http_example/api_models/api_holidays/api_holiday.dart';
import 'package:dio_http_example/ui/dropdown_model.dart';
import 'package:dio_http_example/list.dart';
import 'package:dio_http_example/ui/list_view_page.dart';
import 'package:flutter/material.dart';
import '../api_models/api_countries/api_country.dart';
import '../api_models/api_holidays/api_holiday_type/holiday_type.dart';
import '../holidays_api_dio_client.dart';
import 'holidays_button.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('API Holidays')),
        body: const Center(child: CountryDropdown()),
      ),
    );
  }
}

class CountryDropdown extends StatefulWidget {
  const CountryDropdown({super.key});

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
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
            const Text(
              'Выберите страну:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (countryList != null)
              DropdownModel(
                text: 'Выберите страну',
                list: countryList!,
                convert: (e) => "${e.flagUnicode} ${e.countryName}",
                onSelected: (ApiCountry p1) {
                  setState(() {
                    selectedCountry = p1.iso3166;
                  });
                },
              ),
            const SizedBox(height: 20),
            const Text(
              'Выберите год:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DropdownModel(
              text: 'Выберите год',
              convert: (e) => e.toString(),
              list: years,
              onSelected: (int p1) {
                setState(() {
                  selectedYear = p1;
                });
              },
            ),
            SizedBox(height: 20),
            const Text(
              'Выберите месяц:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DropdownModel(
              text: 'Выберите месяц (необязательно)',
              convert: (e) => e.toString(),
              list: months,
              onSelected: (int p1) {
                setState(() {
                  selectedMonth = p1;
                });
              },
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            const Text(
              'Выберите тип праздика:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DropdownModel(
              text: 'Выберите тип праздника (необязательно)',
              convert: (e) {
                switch (e) {
                  case HolidayType.national:
                    return 'Национальные';
                  case HolidayType.local:
                    return 'Местные';
                  case HolidayType.religious:
                    return 'Религиозные';
                  case HolidayType.observance:
                    return 'Памятные даты';
                }
              },
              list: typesList!,
              onSelected: (HolidayType p1) {
                setState(() {
                  selectedType = p1;
                });
              },
            ),
            SizedBox(height: 20),
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
              Expanded(child: ListViewPage(holidaysList: holidaysList!)),
          ],
        ),
      ),
    );
  }
}
