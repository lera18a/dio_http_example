import 'package:dio_http_example/ui/ui_holiday_page.dart';
import 'package:flutter/widgets.dart';

import '../api_models/api_holidays/api_holiday.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key, required this.holidaysList});
  final List<ApiHoliday> holidaysList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: holidaysList.length,
      padding: EdgeInsets.all(20),
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: UiHolidayPage(holidays: holidaysList[index]),
      ),
    );
  }
}
