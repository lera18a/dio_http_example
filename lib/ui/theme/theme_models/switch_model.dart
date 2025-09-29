import 'package:flutter/material.dart';

class SwitchModel extends StatefulWidget {
  final bool isSwitched;

  const SwitchModel({super.key, this.isSwitched = false});

  @override
  State<SwitchModel> createState() => _SwitchModelState();
}

class _SwitchModelState extends State<SwitchModel> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 40,
      child: Transform.scale(
        scale: 1.2,
        child: Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
          activeTrackColor: Colors.lightGreenAccent,
          activeThumbColor: Colors.green,
        ),
      ),
    );
  }
}
