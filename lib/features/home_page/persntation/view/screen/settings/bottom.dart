import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bottoms extends StatelessWidget {
  final Function() onTap;
  const Bottoms({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60.sp,
        height: 60.sp,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
        ),
        child: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_right),
        ),
      ),
    );
  }
}
