import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/thheming/style.dart';
import '../../../../../core/widget/text_form_filed.dart';
class AppBarSection extends StatefulWidget {
  AppBarSection({super.key});


  @override
  State<AppBarSection> createState() => _AppBarSectionState();
}
class _AppBarSectionState extends State<AppBarSection> {

  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //spase
        SizedBox(height: 7.h),
        //appbar section
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 5.sp),
          child: Container(
            width: 360.w,
            height: 50.h,
            child: Row(
              children: [
                ClipRRect(
                    child: Image(image: AssetImage("assets/images/me2.jpg"),
                      width: 100.sp,
                      height: 50.sp,
                    )),
                Text("Hello,",style: TextStyles.font18blue500weight,),
              ],
            ),
          ),
        ),
        Text("Let's find your medication!,",style: TextStyles.font18blue500weight,),
        //spase
        SizedBox(height: 10.sp),
        // search bar
        SizedBox(
          width: 320.w,
          height: 42.h,
          child: CustomTextFormFiled(
            width: 300.w,
            colorBorder: Colors.blue.shade300,
            height:30.h ,
            color: Colors.white,
            keyboardType: TextInputType.text,
            controller: searchController,
            icon: Icon(Icons.search_sharp,color: Colors.grey.shade400,),
            hintText: "Search pharmacy,medication...",
            validateText: "please Enter any Text",
          ),
        ),
        //spase
        SizedBox(height: 20.h),

      ],
    );
  }
}