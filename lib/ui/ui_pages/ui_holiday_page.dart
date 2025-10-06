import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../api_models/api_holidays/api_holiday.dart';
import '../ui_models/holidays_value_text_model.dart';

class UiHolidayPage extends StatelessWidget {
  const UiHolidayPage({super.key, required this.holidays});
  final ApiHoliday holidays;

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime(
      holidays.date.datetime.year,
      holidays.date.datetime.month ?? 1,
      holidays.date.datetime.day ?? 1,
    );
    final Locale locale = Localizations.localeOf(context);
    final format = DateFormat.yMd(locale.toString());

    // final formatLoc = DateFormat.yMd();
    final dateFormat = format.format(date);
    // final dateFormatLoc = formatLoc.format(date);

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
          Row(children: [HolidayValueTextModel(text: dateFormat)]),
        ],
      ),
    );
  }
}
