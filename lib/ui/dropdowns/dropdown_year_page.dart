import 'package:dio_http_example/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

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
          context.i18n.selectYear,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        DropdownModel(
          text: context.i18n.selectYear,
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
