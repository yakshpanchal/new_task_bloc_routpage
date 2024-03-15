import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: value,
          onChanged: onChanged,
          activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.green,
        ),
        const Text(
          'Tenent View',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            // fontWeight: FontWeight.bold,
            // color: Colors.deepPurple,
          ),
        )
      ],
    );
  }
}
