import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ossos_test/presentation/home/view/widgets/clear_button.dart';
import 'package:ossos_test/presentation/home/view/widgets/custom_button.dart';
import 'package:ossos_test/presentation/resources/strings_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.home),),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
          child: Column(
            children: [

              TextField(
                decoration: InputDecoration(
                  hintText: AppStrings.nameHint
                ),
              ),
              Padding(padding: EdgeInsets.all(20.h)),
              Text('Your name'),
              ClearButton(onPressed: (){},),
              CustomButton(text: AppStrings.page1Button,onPressed: (){}),
              CustomButton(text: AppStrings.page2Button,onPressed: (){}),


            ],
          ),
        ),
      ),
    );
  }
}
