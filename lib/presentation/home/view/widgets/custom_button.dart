import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, this.onPressed, this.color}) : super(key: key);
  final String text;
  final VoidCallback? onPressed;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text),style: ElevatedButton.styleFrom(
      backgroundColor: color
    ),);
  }
}
