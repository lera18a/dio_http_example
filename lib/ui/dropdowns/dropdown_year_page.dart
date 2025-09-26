import 'package:flutter/widgets.dart';

import '../../list.dart';
import '../ui_models/dropdown_model.dart';

class DropDownYearPage extends StatelessWidget {
  final Function(int) onYearSelected;
  final int? selectedYear;

  const DropDownYearPage({
    super.key,
    required this.onYearSelected,
    this.selectedYear,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Выберите год:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        DropdownModel(
          text: 'Выберите год',
          convert: (e) => e.toString(),
          list: years,
          onSelected: (int year) {
            onYearSelected(year);
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
