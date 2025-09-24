import 'package:flutter/widgets.dart';

import '../../list.dart';
import '../ui_models/dropdown_model.dart';

class DropDowmMonthPage extends StatefulWidget {
  const DropDowmMonthPage({super.key, required this.onMonthSelected});
  final Function(int) onMonthSelected;

  @override
  State<DropDowmMonthPage> createState() => _DropDowmMonthPageState();
}

class _DropDowmMonthPageState extends State<DropDowmMonthPage> {
  int? selectedMonth;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Выберите месяц:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        DropdownModel(
          text: 'Выберите месяц (необязательно)',
          convert: (e) => e.toString(),
          list: months,
          onSelected: (int p1) {
            setState(() {
              selectedMonth = p1;
              widget.onMonthSelected(selectedMonth!);
            });
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
