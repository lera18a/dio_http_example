import 'package:flutter/material.dart';

class HolidaysButton extends StatelessWidget {
  const HolidaysButton({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Text(
          'Вывести праздники',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
