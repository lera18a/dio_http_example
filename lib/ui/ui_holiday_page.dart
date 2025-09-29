import 'package:dio_http_example/ui/ui_models/trifle_model.dart';
import 'package:flutter/material.dart';

import '../api_models/api_holidays/api_holiday.dart';
import 'ui_models/holidays_value_text_model.dart';

class UiHolidayPage extends StatelessWidget {
  const UiHolidayPage({super.key, required this.holidays});
  final ApiHoliday holidays;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,

        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          HolidayValueTextModel(text: holidays.country.name),
          HolidayValueTextModel(text: holidays.name),
          HolidayValueTextModel(text: holidays.description),
          HolidayValueTextModel(text: holidays.type.join()),
          Row(
            children: [
              if (holidays.date.datetime.day! < 10) TrifleModel(text: '0'),
              HolidayValueTextModel(text: '${holidays.date.datetime.day}'),
              TrifleModel(text: '.'),
              if (holidays.date.datetime.month! < 10) TrifleModel(text: '0'),
              HolidayValueTextModel(text: '${holidays.date.datetime.month}'),
              TrifleModel(text: '.'),
              HolidayValueTextModel(text: '${holidays.date.datetime.year}'),
            ],
          ),
        ],
      ),
    );
  }
}
