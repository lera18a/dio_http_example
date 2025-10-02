import 'package:dio_http_example/ui/ui_models/list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc_holidays/holidays_bloc.dart';

class HolidaysViewPage extends StatelessWidget {
  const HolidaysViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HolidaysBloc, HolidaysState>(
      builder: (context, state) {
        if (!state.isLoading &&
            state.stateHolidaysList.isEmpty &&
            state.stateCountry != null &&
            state.stateYear != null) {
          return Scaffold(
            body: Center(
              child: Text(
                'Праздники не найдены',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(title: Text('HolidayView')),
            body: Column(
              children: [
                Expanded(
                  child: ListViewModel(holidaysList: state.stateHolidaysList),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
