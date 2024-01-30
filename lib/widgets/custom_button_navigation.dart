import 'package:flutter/material.dart';

class CustomButtonNavigation extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const CustomButtonNavigation({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        backgroundColor: Colors.teal,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 12,
        ),
        elevation: 8,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
