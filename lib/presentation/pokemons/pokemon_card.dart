import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 200.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15)
      ),
            child: Row(
              children: [
                Expanded(child: Image.network('')),
                Expanded(child: Text('Pokemon Name'))
              ],
            ),
    );
  }
}
