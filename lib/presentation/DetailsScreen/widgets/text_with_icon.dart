import 'package:flutter/material.dart';

class TextWithIcon extends StatelessWidget {
  const TextWithIcon({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
