import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ossos_test/app/bloc/app_bloc.dart';
import 'package:ossos_test/presentation/resources/color_manager.dart';
import 'package:ossos_test/presentation/resources/strings_manager.dart';

//The page is implemented using an enum for shapes,
// a better approach for scalability would be using the State Design Pattern



class AnimationsPage extends StatefulWidget {
  @override
  _AnimationsPageState createState() => _AnimationsPageState();
}

enum Shape {
  SQAURE,
  RECTANGLE,
  CIRCLE,
}

class _AnimationsPageState extends State<AnimationsPage> {
  Shape selectedShape = Shape.SQAURE; // Initial shape

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.animations),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return Text(state.name ?? AppStrings.yourName);
              },
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 400.h,
            width: 400.h,
            decoration: ShapeDecoration(
                color: _getColorForShape(selectedShape),
                shape: _getShapeBorder(selectedShape)),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildShapeButton(Shape.SQAURE),
                _buildShapeButton(Shape.RECTANGLE),
                _buildShapeButton(Shape.CIRCLE),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color? _getColorForShape(Shape shape) {
    switch (shape) {
      case Shape.SQAURE:
        return ColorManager.primary;
      case Shape.RECTANGLE:
        return ColorManager.lightPrimary;

      case Shape.CIRCLE:
        return ColorManager.circleColor;

      default:
        return ColorManager.primary;
    }
  }

  ShapeBorder _getShapeBorder(Shape shape) {
    switch (shape) {
      case Shape.SQAURE:
        return const  RoundedRectangleBorder();
      case Shape.RECTANGLE:
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
      case Shape.CIRCLE:
        return const CircleBorder();
    }
  }

  Widget _buildShapeButton(Shape shape) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedShape = shape;
        });
      },
      child: _buildShape(shape),
    );
  }

  Widget _buildShape(Shape shape) {
    switch (shape) {
      case Shape.SQAURE:
        return _Square();
      case Shape.RECTANGLE:
        return _Rectangle();
      case Shape.CIRCLE:
        return _Circle();
      default:
        return Container();
    }
  }
}

class _Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.h,
      height: 75.h,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: ColorManager.primary,
      ),
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.h,
      height: 75.h,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        color: ColorManager.lightPrimary,
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.h,
      height: 75.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorManager.circleColor,
      ),
    );
  }
}
