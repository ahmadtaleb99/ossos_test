import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ossos_test/presentation/resources/color_manager.dart';
import 'package:ossos_test/presentation/resources/strings_manager.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({Key? key, this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 150.w,
      height: 50.h,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: ColorManager.red
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.delete),
            SizedBox(width: 5.w,),
            Text(AppStrings.clearText)
          ],
        )
      ),
    );
  }
}
