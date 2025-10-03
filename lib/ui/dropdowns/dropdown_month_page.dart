import 'package:flutter/material.dart';
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
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          'Выберите месяц:',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
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
      ],
    );
  }
}
