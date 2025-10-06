import 'package:dio_http_example/extensions/app_localizations_extension.dart';
import 'package:dio_http_example/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import '../../api_models/api_holidays/api_holiday_type/holiday_type.dart';
import '../ui_models/dropdown_model.dart';

class DropDownTypePage extends StatelessWidget {
  final Function(HolidayType) onTypeSelected;
  final List<HolidayType>? typesList;

  const DropDownTypePage({
    super.key,
    required this.onTypeSelected,
    this.typesList,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          context.i18n.selectHolidaysTipe,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        if (typesList == null)
          Text(context.i18n.loadingTypes, style: TextStyle(color: Colors.grey))
        else if (typesList!.isEmpty)
          Text(context.i18n.typesNotFound, style: TextStyle(color: Colors.grey))
        else
          DropdownModel(
            text: context.i18n.selectHolidaysTipe,
            convert: (e) => context.i18n.holidayType(e),
            list: typesList!,
            onSelected: (HolidayType type) {
              onTypeSelected(type);
            },
          ),
      ],
    );
  }
}
