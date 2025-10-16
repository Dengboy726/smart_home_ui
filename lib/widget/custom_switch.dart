import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final IconData icon;

  const CustomSwitch(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.icon});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Switch(
          value: widget.value,
          onChanged: widget.onChanged,
          activeColor: Colors.black,
        ),
        Positioned(
          left: widget.value ? 32 : 15,
          child: Icon(
            widget.icon,
            color: Colors.white,
            size: widget.value ? 16 : 10,
          ),
        )
      ],
    );
  }
}
