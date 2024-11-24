import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/appbar_section.dart';
import '../widget/category_section.dart';
import '../widget/item_section.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child:  Column(
              children: [
                AppBarSection(),
                CategorySection(),
                SizedBox(height: 10.h,),
                ItemSection(),
                SizedBox(height: 28.h),
              ],

            ),
          ),
        ),
      ),
    );
  }
}










