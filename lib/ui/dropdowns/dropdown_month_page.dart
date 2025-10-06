import 'package:dio_http_example/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

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
          context.i18n.selectMonth,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        DropdownModel(
          text: context.i18n.selectMonth,
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
