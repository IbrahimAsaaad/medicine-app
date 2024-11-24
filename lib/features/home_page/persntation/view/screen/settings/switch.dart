import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SettingsStwting extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color iconColor;
  final IconData icon;
  final Function(bool value) onTap;
  final bool value2;
  const SettingsStwting({super.key, required this.title, required this.bgColor, required this.iconColor, required this.icon, required this.onTap, required this.value2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity.sp,
      child:  Row(
        children: [
          Container(
            width: 50.sp,
            height: 50.sp,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            child: Icon(
              icon,
              color: iconColor,),
          ),
          SizedBox(width: 20.sp),
          Text(title,style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),),
          const Spacer(),
              Text(
                value2 ?
            "On":"Off",style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey,
          ),),
          SizedBox(width: 7.sp),
         CupertinoSwitch(value: value2, onChanged: onTap)
        ],
      ),
    );
  }
}
