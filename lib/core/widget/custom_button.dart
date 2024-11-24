import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key,
    required this.color,
    required this.textStyleButton,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.label,
    required this.functionButton,
   // required this.functionButton,
  });

  double width ;
  double height ;
  Color color ;
  double borderRadius ;
  String label ;
  TextStyle textStyleButton ;
  Function() functionButton ;
  //Function() functionButton ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: functionButton,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(label,style:TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w600) ,),
        ),
      ),
    );
  }
}
