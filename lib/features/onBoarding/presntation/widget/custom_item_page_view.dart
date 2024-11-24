import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/thheming/color.dart';
import '../../../../core/thheming/style.dart';

class OnBoardingItem extends StatelessWidget {
  OnBoardingItem({super.key,required this.image,required this.title,required this.snbTitle});
  String image ;
  String  title;
  String snbTitle ;
// images
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column (
          children:   [
            SizedBox(height: 30.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image(
                image:AssetImage(image),
                width: 500.w,
                height: 500.h,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 30.h),

            Text(title,style:TextStyles.font25black87700weight),

            SizedBox(height: 30.h),

            Text(snbTitle,style: TextStyle(color:Colors.grey), textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}