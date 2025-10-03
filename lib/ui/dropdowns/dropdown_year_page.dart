import 'package:flutter/material.dart';
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
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          'Выберите год:',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
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
      ],
    );
  }
}
