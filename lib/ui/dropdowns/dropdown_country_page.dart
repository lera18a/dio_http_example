import 'package:dio_http_example/api_models/api_countries/api_country.dart';
import 'package:flutter/widgets.dart';
import '../ui_models/dropdown_model.dart';

class DropDownCountryPage extends StatelessWidget {
  final Function(String) onCountrySelected;
  final List<ApiCountry> countryList;

  const DropDownCountryPage({
    super.key,
    required this.onCountrySelected,
    required this.countryList,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Выберите страну:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        DropdownModel(
          text: countryList.isEmpty ? 'Загрузка' : 'Выбираете страну',
          list: countryList,
          convert: (e) => "${e.flagUnicode} ${e.countryName}",
          onSelected: (ApiCountry country) {
            onCountrySelected(country.iso3166);
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
