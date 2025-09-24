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
    return Column(
      children: [
        Column(
          children: [
            DropdownButton<T>(
              isExpanded: true,
              value: selected,
              hint: Text(widget.text),
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 30,
              elevation: 8,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              underline: Container(height: 2, color: Colors.blue),
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
            const SizedBox(width: 30),
            if (selected != null)
              Text(
                'Вы выбрали: ${widget.convert(selected!)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
