import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ossos_test/presentation/resources/color_manager.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.image, required this.name}) : super(key: key);

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
              color: Color(0xffbfbfbf),
              blurRadius: 4,
              offset: Offset(4, 13.h),
              spreadRadius: -4.r),
        ],
      ),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Image.network(
                image,
                loadingBuilder: (context, widget, event) => Center(
                  child: CircularProgressIndicator(),
                ),
              )),
          Expanded(flex: 5, child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(name),
              )))
        ],
      ),
    );
  }
}
