import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ossos_test/presentation/home/view/widgets/clear_button.dart';
import 'package:ossos_test/presentation/home/view/widgets/custom_button.dart';
import 'package:ossos_test/presentation/resources/color_manager.dart';
import 'package:ossos_test/presentation/resources/strings_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.home),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 30.h),
                child: const TextField(
                  decoration:
                  InputDecoration(hintText: AppStrings.nameHint),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 20.h),
                child: Text('Your name'),
              ),
              SizedBox(height: 375.h,),
              ClearButton(
                onPressed: () {},
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: CustomButton(
                  text: AppStrings.page1Button,
                  onPressed: () {},
                  color: ColorManager.lightPrimary,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: CustomButton(
                    text: AppStrings.page2Button, onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
