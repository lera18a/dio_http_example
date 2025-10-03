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
          'Выберите тип праздика:',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        if (typesList == null)
          const Text('Загрузка типов...', style: TextStyle(color: Colors.grey))
        else if (typesList!.isEmpty)
          const Text('Типы не найдены', style: TextStyle(color: Colors.grey))
        else
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
            onSelected: (HolidayType type) {
              onTypeSelected(type);
            },
          ),
      ],
    );
  }
}
