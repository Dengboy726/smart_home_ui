import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final IconData iconData;
  const ActionButton({super.key, required this.label, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: const BorderSide(color: Colors.black12),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 10,
        ),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Icon(iconData, color: Colors.black),
          const SizedBox(
            width: 8,
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
