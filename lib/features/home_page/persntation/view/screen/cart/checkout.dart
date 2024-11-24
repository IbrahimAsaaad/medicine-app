import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widget/text_form_filed.dart';
import 'cart.dart';
import 'order.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {

  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController ZapcodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController emaiController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_){
              return Cart();
            }));
          },
          icon: Icon(Icons.chevron_left,color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        title: Center(
          child: Text("CheckOut",style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold
          ),),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(left: 10,right: 10),
        children: [
          SizedBox(height: 20.sp),
          Text("Shopping Details",style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18.sp
          ),),
          SizedBox(height: 20.sp),
          CustomTextFormFiled(
            hintText: 'Full Name',
            controller: lastNameController,
            keyboardType: TextInputType.text,
            validateText: 'Please Enter Your Name',
            width: 250.w,
            height: 40.h,
            color: Colors.white,
            icon: const Icon(
              Icons.perm_identity_outlined,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20.sp),
          CustomTextFormFiled(
            hintText: 'Street Address',
            controller: locationController,
            keyboardType: TextInputType.text,
            validateText: 'Please Enter Your Name',
            width: 250.w,
            height: 40.h,
            color: Colors.white,
            icon: const Icon(
              Icons.perm_identity_outlined,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20.sp),
          Row(
            children: [
              CustomTextFormFiled(
                hintText: 'City',
                controller: cityController,
                keyboardType: TextInputType.text,
                validateText: 'Please Enter Your Name',
                width: 120.w,
                height: 40.h,
                color: Colors.white,
                icon: const Icon(
                  Icons.perm_identity_outlined,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 65.sp),
              CustomTextFormFiled(
                hintText: 'Zap Code',
                controller: ZapcodeController,
                keyboardType: TextInputType.phone,
                validateText: 'Please Enter Your Name',
                width: 120.w,
                height: 40.h,
                color: Colors.white,
                icon: const Icon(
                  Icons.perm_identity_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.sp),
          CustomTextFormFiled(
            hintText: 'Phone Number',
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validateText: 'Please Enter Your Phone',
            width: 300.w,
            height: 40.h,
            color: Colors.white,
            icon: const Icon(
              Icons.phone,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20.sp),
          CustomTextFormFiled(
            hintText: 'Email Address',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validateText: 'Please Enter Your Email',
            width: 300.w,
            height: 40.h,
            color: Colors.white,
            icon: Icon(
              Icons.email_outlined,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20.sp),
          Text("Payment Method",style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500
          ),),
          SizedBox(height: 20.sp),
          Row(
            children: [
              ClipRRect(
                  child: Image(image: AssetImage("assets/images/check3.png"),
                  width: 80.sp,
                    height: 40.sp,
                  )),
              SizedBox(width: 5.sp),
              ClipRRect(
                  child: Image(image: AssetImage("assets/images/check2.png"),
                    width: 80.sp,
                    height: 40.sp,
                  )),
              SizedBox(width: 5.sp),
              ClipRRect(
                  child: Image(image: AssetImage("assets/images/check1.png"),
                    width: 80.sp,
                    height: 40.sp,
                  )),
            ],
          ),
          SizedBox(height: 20.sp),
          CustomTextFormFiled(
            hintText: 'Select payment mayhod',
            controller: emaiController,
            keyboardType: TextInputType.text,
            validateText: 'Please Enter Your Phone',
            width: 300.w,
            height: 40.h,
            color: Colors.white,
            icon: const Icon(
              Icons.phone,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20.sp),
          Container(
            width: 250.sp,
            height: 40.sp,
            decoration: BoxDecoration(
              color: Colors.blue.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_){
                  return const Order();
                }));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                  foregroundColor: Colors.blue.shade100),
              child:  (
                  Text("Pay Now",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp

                  ),)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
