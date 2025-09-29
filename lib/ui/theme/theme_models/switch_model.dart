import 'package:flutter/material.dart';

class SwitchModel extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchModel({super.key, this.value = false, required this.onChanged});

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
          value: widget.value,
          onChanged: widget.onChanged,
          activeTrackColor: Colors.lightGreenAccent,
          activeThumbColor: Colors.green,
        ),
      ),
    );
  }
}
