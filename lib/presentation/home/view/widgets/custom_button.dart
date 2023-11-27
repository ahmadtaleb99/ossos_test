import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ossos_test/presentation/resources/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, this.onPressed, this.color}) : super(key: key);
  final String text;
  final VoidCallback? onPressed;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: onPressed, child: Text(text),style: ElevatedButton.styleFrom(

        backgroundColor: color ?? ColorManager.primary,
          foregroundColor: ColorManager.white
      ),),
    );
  }
}
