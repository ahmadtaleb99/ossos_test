import 'package:flutter/material.dart';
import 'package:ossos_test/presentation/resources/strings_manager.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({Key? key, this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(Icons.delete),
          Text(AppStrings.clearText)
        ],
      )
    );
  }
}
