import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled(
      {super.key,
        required this.hintText,
        this.obscureText = false,
        this.colorBorder =  Colors.grey,
        required this.controller,
        required this.keyboardType,
        required this.validateText,
        required this.width,
        required this.height,
        required this.color,
        required this.icon,
      });

  String hintText;
  bool obscureText;
  TextEditingController controller;
  Color colorBorder;
  TextInputType keyboardType;
  String validateText;
  double width ;
  double height ;
  Color color ;
  Widget icon ;


  @override
  Widget build(BuildContext context) {
    return Container(
      width:width.w ,
      height: height.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText:hintText,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: colorBorder,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: colorBorder,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: colorBorder,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: colorBorder,
            ),
          ),
        ),
        cursorColor: Colors.black54,
        obscureText:obscureText,
        controller:controller,
        keyboardType:keyboardType,
        validator: (val) {
          if (val!.isEmpty) {
            return validateText;
          }
        },
      ),
    );
  }
}
