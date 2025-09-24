import 'package:flutter/widgets.dart';

class TrifleModel extends StatelessWidget {
  const TrifleModel({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
