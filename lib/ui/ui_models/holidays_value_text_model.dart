import 'package:flutter/widgets.dart';

class HolidayValueTextModel extends StatelessWidget {
  const HolidayValueTextModel({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
