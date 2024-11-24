import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/core/widget/text_form_filed.dart';
import '../../../../../../core/thheming/style.dart';
import '../../../../../../core/widget/custom_button.dart';
import '../../../../../../location.dart';
import '../../../../register/persntation/view/screen/register.dart';
import '../../manger/Auth_cubit.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  clear(){
    emailController.clear();
    passwordController.clear();
  }

  GlobalKey <FormState> loginKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 800.h,
          child:  Form(
            key: loginKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 70.h),
                  // image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                        width: 200.w,
                        height: 160.h,
                        fit: BoxFit.fill,
                        image:
                        const AssetImage('assets/images/logo5.png')),
                  ),
                  //spase
                  SizedBox(height: 20.h),
                  // title of page
                  Text(
                    "Welcome Back!",
                    style: TextStyles.font28black700weight,
                  ),
                  //spase
                  SizedBox(height: 10.h),
                  Text(
                    "Use Credentials to access your account",
                    style: TextStyles.font14black38300weight,
                  ),
                  //spase
                  SizedBox(height: 20.h),
                  //email
                  CustomTextFormFiled(
                    hintText: ' Enter Your Email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validateText: 'Please Enter Your Email',
                    width: 300.w,
                    height: 35.h,
                    color: Colors.grey.shade200,
                    icon: const Icon(
                      Icons.email_outlined,
                      color: Colors.grey,

                    ),
                  ),
                  //spase
                  SizedBox(height: 20.h),
                  // password
                  CustomTextFormFiled(
                    hintText: 'Enter Your Password',
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    validateText: 'Please Enter Your Password',
                    obscureText: true,
                    width: 300.w,
                    height: 35.h,
                    color: Colors.grey.shade200,
                    icon: Icon(
                      Icons.lock_outline,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 15.h),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Container(
                        padding: EdgeInsets.only(right: 15),
                          child:
                          Text("Forgot Password?",style:
                          TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue.shade300
                          ),)),
                    ],
                  ),
                  //spase
                  SizedBox(height: 80.h),
                  //Button
                  CustomButton(
                      color: Colors.blue.shade300,
                      textStyleButton:
                      TextStyles.font25black700weight,
                      height: 40.h,
                      width: 300.w,
                      borderRadius: 12,
                      label: 'Login',
                      functionButton: () {
                        AuthCubit.get(context)
                            .loginFunction(
                          ctx: context,
                          email: emailController.text,
                          password: passwordController.text,
                        )
                            .then((value) {
                          Navigator.push(context, MaterialPageRoute(builder: (_){
                            return const Location();
                          }));
                          print("LOGIN SUCCESS");
                        });
                      }
                      ),
                  //spase
                  SizedBox(height: 10.h),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) {
                              return const RegisterPage();
                            }));
                      },
                      child: const
                      Text("Don't have an account ? Register Now",),
                  ),
                  //spase
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
