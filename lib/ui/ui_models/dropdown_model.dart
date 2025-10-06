import 'package:dio_http_example/extensions/build_context_extensions.dart';
import 'package:dropdown_search/dropdown_search.dart';
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
        DropdownSearch<T>(
          popupProps: PopupProps.modalBottomSheet(
            showSearchBox: true,
            itemBuilder: (context, item, isDisabled, isSelected) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                widget.convert(item),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface,
                ),
              ),
            ),
            searchFieldProps: TextFieldProps(
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                labelStyle: theme.textTheme.bodyMedium,
                labelText: context.i18n.search,
                hintText: context.i18n.startTyping,
                hintStyle: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            modalBottomSheetProps: ModalBottomSheetProps(
              backgroundColor: theme.scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
            ),
          ),
          compareFn: (T? a, T? b) => a == b,
          items: (filter, infiniteScrollProps) => widget.list,
          itemAsString: widget.convert,
          selectedItem: selected,
          decoratorProps: DropDownDecoratorProps(
            baseStyle: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
            decoration: InputDecoration(
              hintText: widget.text,
              hintStyle:
                  theme.textTheme.labelMedium?.copyWith(
                    color: theme.hintColor,
                  ) ??
                  const TextStyle(fontSize: 14, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: theme.colorScheme.outline,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
            ),
          ),
          onChanged: (T? newValue) {
            setState(() {
              selected = newValue;
              if (newValue != null) widget.onSelected(newValue);
            });
          },
        ),

        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 20),
          child: Text(
            selected != null
                ? ' ${context.i18n.youChose} ${widget.convert(selected!)}'
                : '',
            style: theme.textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
