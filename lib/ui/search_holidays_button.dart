import 'package:dio_http_example/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class SearchHolidaysButton extends StatelessWidget {
  const SearchHolidaysButton({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.all(35)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        backgroundColor: WidgetStatePropertyAll(theme.colorScheme.primary),
        foregroundColor: WidgetStateProperty.all(theme.colorScheme.onPrimary),
      ),
      onPressed: onPressed,
      child: Text(
        context.i18n.searchHolidays,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
