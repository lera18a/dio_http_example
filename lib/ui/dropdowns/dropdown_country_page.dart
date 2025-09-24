import 'package:dio_http_example/api_models/api_countries/api_country.dart';
import 'package:flutter/widgets.dart';

import '../../api_key.dart';
import '../../holidays_api_dio_client.dart';
import '../ui_models/dropdown_model.dart';

class DropDownCountryPage extends StatefulWidget {
  const DropDownCountryPage({super.key, required this.onCountrySelected});
  final Function(String) onCountrySelected;

  @override
  State<DropDownCountryPage> createState() => _DropDownCountryPageState();
}

class _DropDownCountryPageState extends State<DropDownCountryPage> {
  List<ApiCountry>? countryList;
  HolidaysApiDioClient apiClient = HolidaysApiDioClient(
    apiKey: apiKey,
    host: 'https://calendarific.com/api/v2',
  );
  String? selectedCountry;

  @override
  void initState() {
    super.initState();
    apiClient
        .getCountries()
        .then((value) => countryList = value.response.countries)
        .then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                widget.onCountrySelected(selectedCountry!);
              });
            },
          ),
        const SizedBox(height: 20),
      ],
    );
  }
}
