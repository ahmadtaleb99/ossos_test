import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ossos_test/app/bloc/app_bloc.dart';
import 'package:ossos_test/presentation/home/view/widgets/clear_button.dart';
import 'package:ossos_test/presentation/home/view/widgets/custom_button.dart';
import 'package:ossos_test/presentation/resources/color_manager.dart';
import 'package:ossos_test/presentation/resources/routes_manager.dart';
import 'package:ossos_test/presentation/resources/strings_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AppBloc>();
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
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: TextField(
                  controller: _nameController,
                  onChanged: (name) {
                    bloc.add(NameChanged(name));
                  },
                  decoration:
                  const InputDecoration(hintText: AppStrings.nameHint),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: BlocBuilder<AppBloc, AppState>(
                  builder: (context, state) {
                    return Text(state.name ?? AppStrings.yourName);
                  },
                ),
              ),
              SizedBox(height: 375.h,),
              ClearButton(
                onPressed: ()  {
                  bloc.add(NameCleared());
                  _nameController.clear();
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: CustomButton(
                  text: AppStrings.page1Button,
                  onPressed: () => Navigator.pushNamed(context, Routes.animations),
                  color: ColorManager.primary,
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
