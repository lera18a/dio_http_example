import 'package:flutter/material.dart';

class HolidaysButton extends StatelessWidget {
  const HolidaysButton({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.all(20)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(Colors.blue.shade200),
      ),
      onPressed: onPressed,
      child: Text(
        'Вывести праздники',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
