import 'package:flutter/material.dart';

class CustomFilterBar extends StatefulWidget {
  final List<String> filters;
  final List<bool> isSelected;
  final Function(int) onPressed;

  const CustomFilterBar({
    Key? key,
    required this.filters,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CustomFilterBarState createState() => _CustomFilterBarState();
}

class _CustomFilterBarState extends State<CustomFilterBar> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: widget.filters
          .map((filter) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(filter),
              ))
          .toList(),
      onPressed: widget.onPressed,
      isSelected: widget.isSelected,
      borderRadius: BorderRadius.circular(10),
      borderWidth: 2,
      borderColor: const Color(0xFF1CB5B0),
      selectedColor: Colors.white,
      fillColor: const Color(0xFF1CB5B0),
      selectedBorderColor: const Color(0xFF1CB5B0),
      splashColor: Colors.amber,
    );
  }
}
