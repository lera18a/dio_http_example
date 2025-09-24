import 'package:flutter/widgets.dart';

import '../../list.dart';
import '../ui_models/dropdown_model.dart';

class DropDownYearPage extends StatefulWidget {
  const DropDownYearPage({super.key});

  @override
  State<DropDownYearPage> createState() => _DropDownYearPageState();
}

class _DropDownYearPageState extends State<DropDownYearPage> {
  int? selectedYear;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Выберите год:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        DropdownModel(
          text: 'Выберите год',
          convert: (e) => e.toString(),
          list: years,
          onSelected: (int p1) {
            setState(() {
              selectedYear = p1;
            });
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
