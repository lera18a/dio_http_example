import 'package:flutter/widgets.dart';

import '../../api_models/api_holidays/api_holiday_type/holiday_type.dart';
import '../ui_models/dropdown_model.dart';

class DropDownTypePage extends StatefulWidget {
  const DropDownTypePage({super.key, required this.onTypeSelected});
  final Function(HolidayType) onTypeSelected;

  @override
  State<DropDownTypePage> createState() => _DropDownTypePageState();
}

class _DropDownTypePageState extends State<DropDownTypePage> {
  List<HolidayType>? typesList;
  HolidayType? selectedType;

  @override
  void initState() {
    super.initState();
    typesList = HolidayType.values;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Выберите тип праздика:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
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
          onSelected: (HolidayType p1) {
            setState(() {
              selectedType = p1;
              widget.onTypeSelected(selectedType!);
            });
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
