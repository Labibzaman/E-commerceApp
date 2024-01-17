import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector(
      {super.key, required this.Productcolors, required this.onChanged});

  final List Productcolors;
  final Function onChanged;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.Productcolors.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.Productcolors.map((c) => InkWell(
        onTap: () {
          _selectedColor = c;
          if (mounted) {
            setState(() {});
          }
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundColor: c,
            radius: 15,
            child: _selectedColor == c
                ? const Icon(
              Icons.done,
              color: Colors.white,
            )
                : null,
          ),
        ),
      )).toList(),
    );
  }
}