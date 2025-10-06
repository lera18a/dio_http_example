import 'package:flutter/material.dart';

class SwitchModel extends StatelessWidget {
  const SwitchModel({
    super.key,
    required this.text1,
    required this.text2,
    required this.switchWidget,
  });
  final String text1;
  final String text2;
  final Widget switchWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  text1,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: switchWidget,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  text2,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
