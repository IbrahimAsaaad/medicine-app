import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/thheming/style.dart';
import '../../../../../../core/widget/custom_button.dart';
import '../../../../../../core/widget/text_form_filed.dart';
import '../../../../login/persntation/manger/Auth_cubit.dart';
import '../../../../login/persntation/view/screen/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  clear() {
    emailController.clear();
    firstNameController.clear();
    lastNameController.clear();
    locationController.clear();
    phoneController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 90.h),
                  // image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                        width: 200.w,
                        height: 160.h,
                        fit: BoxFit. fill,
                        image: const AssetImage('assets/images/logo5.png')),
                  ),
                  //spase

                  //spase
                  SizedBox(height: 20.h),
                  // title of page
                  Text(
                    "Hello!",
                    style: TextStyles.font28black700weight,
                  ),
                  SizedBox(height: 7.h),
                  Text(
                    "Create a new account to get started!",
                    style: TextStyles.font14black38300weight,
                  ),
                  //spase
                  SizedBox(height: 20.h),
                  //name
                  CustomTextFormFiled(
                    hintText: 'Enter Your Name',
                    controller: firstNameController,
                    keyboardType: TextInputType.text,
                    validateText: 'Please Enter Your Name',
                    width: 300.w,
                    height: 35.h,
                    color: Colors.grey.shade200,
                    icon: const Icon(
                      Icons.perm_identity_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  // space
                  SizedBox(height: 20.h),
                  // lastname
                  CustomTextFormFiled(
                    hintText: 'Enter Your Name Last ',
                    controller: lastNameController,
                    keyboardType: TextInputType.text,
                    validateText: 'Please Enter Your Name',
                    width: 300.w,
                    height: 35.h,
                    color: Colors.grey.shade200,
                    icon: const Icon(
                      Icons.perm_identity_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  //spase
                  SizedBox(height: 20.h),
                  //phone
                  CustomTextFormFiled(
                    hintText: 'Enter Your Phone',
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validateText: 'Please Enter Your Phone',
                    width: 300.w,
                    height: 35.h,
                    color: Colors.grey.shade200,
                    icon: const Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                  ),
                  //spase
                  SizedBox(height: 20.h),
                  //location
                  CustomTextFormFiled(
                    hintText: 'Enter Your Address',
                    controller: locationController,
                    keyboardType: TextInputType.text,
                    validateText: 'Please Enter Your Address',
                    width: 300.w,
                    height: 35.h,
                    color: Colors.grey.shade200,
                    icon: const Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                  ),
                  //spase
                  SizedBox(height: 20.h),
                  //email
                  CustomTextFormFiled(
                    hintText: 'Enter Your Email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validateText: 'Please Enter Your Email',
                    width: 300.w,
                    height: 35.h,
                    color: Colors.grey.shade200,
                    icon: Icon(
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
                  //spase
                  SizedBox(height: 20.h),
                  //Button
                  CustomButton(
                    color: Colors.blue.shade300,
                    textStyleButton: TextStyles.font25black700weight,
                    height: 40.h,
                    width: 300.w,
                    borderRadius: 14,
                    label: 'Register Now!',
                    functionButton: () {
                      AuthCubit.get(context)
                          .registerFunction(
                        email: emailController.text,
                        password: passwordController.text,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        phone: phoneController.text,
                        address: locationController.text,
                      )
                          .then(
                              (value) => {
                                Navigator.push(context, MaterialPageRoute(builder: (_){
                                  return const Login_Page();
                                })),
                            print('Register SUCCESS'), clear()});
                    },
                  ),
                  //spase
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
