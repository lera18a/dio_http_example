import 'package:flutter/widgets.dart';

import '../../list.dart';
import '../ui_models/dropdown_model.dart';

class DropDownMonthPage extends StatelessWidget {
  final Function(int) onMonthSelected;
  final int? selectedMonth;

  const DropDownMonthPage({
    super.key,
    required this.onMonthSelected,
    this.selectedMonth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Выберите месяц:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        DropdownModel(
          text: 'Выберите месяц (необязательно)',
          convert: (e) => e.toString(),
          list: months,
          onSelected: (int month) {
            onMonthSelected(month);
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
