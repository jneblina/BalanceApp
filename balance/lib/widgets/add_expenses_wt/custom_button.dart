import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? color;
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const CustomButton({
    Key? key,
    this.onPressed,
    this.label = '',
    this.width = 130,
    this.height = 50,
    this.backgroundColor = Colors.blue,
    this.color = Colors.white,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(Size(width, height)),
            backgroundColor: MaterialStatePropertyAll(backgroundColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(0),
            ))),
        onPressed: onPressed,
        child: Text(label,
            style: TextStyle(
              color: color,
              fontSize: 18,
            )));
  }
}
