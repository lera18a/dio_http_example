import 'package:flutter/material.dart';

class HolidaysButton extends StatelessWidget {
  const HolidaysButton({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.all(20)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        backgroundColor: WidgetStatePropertyAll(theme.colorScheme.primary),
        foregroundColor: WidgetStateProperty.all(theme.colorScheme.onPrimary),
      ),
      onPressed: onPressed,
      child: Text(
        'Вывести праздники',
        style: theme.textTheme.titleSmall?.copyWith(
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
