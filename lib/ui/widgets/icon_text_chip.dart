import 'package:flutter/material.dart';

class IconTextChip extends StatelessWidget {
  const IconTextChip({
    Key? key,
    required this.text,
    required this.iconData,
  }) : super(key: key);

  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(color: Colors.black.withOpacity(.5)),
        ),
        const SizedBox(width: 10)
      ],
    );
  }
}
