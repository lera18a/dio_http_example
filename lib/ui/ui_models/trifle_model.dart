import 'package:flutter/material.dart';

class TrifleModel extends StatelessWidget {
  const TrifleModel({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
