import 'package:flutter/material.dart';

import '../api_models/api_holidays/api_holiday.dart';

class UiHolidayPage extends StatelessWidget {
  const UiHolidayPage({super.key, required this.holidays});
  final ApiHoliday holidays;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green.shade400,

        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          HolidayValueText(text: holidays.country.name),
          HolidayValueText(text: holidays.name),
          HolidayValueText(text: holidays.description),
          HolidayValueText(text: holidays.type.join()),
          Row(
            children: [
              HolidayValueText(text: '${holidays.date.datetime.day}'),
              HolidayValueText(text: '${holidays.date.datetime.month}'),
              HolidayValueText(text: '${holidays.date.datetime.year}'),
            ],
          ),
        ],
      ),
    );
  }
}

class HolidayValueText extends StatelessWidget {
  const HolidayValueText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
