import 'package:flutter/material.dart';

class DropdownModel<T> extends StatefulWidget {
  const DropdownModel({
    super.key,
    required this.text,
    required this.list,
    required this.onSelected,
    required this.convert,
  });
  final String text;
  final List<T> list;
  final void Function(T) onSelected;
  final String Function(T) convert;
  @override
  State<DropdownModel<T>> createState() => _DropdownModelState<T>();
}

class _DropdownModelState<T> extends State<DropdownModel<T>> {
  T? selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Column(
          children: [
            DropdownButton<T>(
              isExpanded: true,
              value: selected,
              hint: Text(
                widget.text,
                style:
                    theme.textTheme.labelMedium?.copyWith(
                      color: theme.hintColor,
                    ) ??
                    const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 30,
              elevation: 8,
              //стиль из темы
              style: theme.textTheme.bodyMedium,
              // акцентный цвет темы
              underline: Container(height: 2, color: theme.colorScheme.primary),
              onChanged: (T? newValue) {
                setState(() {
                  selected = newValue;
                  if (newValue != null) widget.onSelected(newValue);
                });
              },
              items: widget.list.map<DropdownMenuItem<T>>((T country) {
                return DropdownMenuItem<T>(
                  value: country,
                  child: Text(widget.convert(country)),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            if (selected != null)
              Text(
                'Вы выбрали: ${widget.convert(selected!)}',
                style: theme.textTheme.titleSmall,
              ),
          ],
        ),
      ],
    );
  }
}
