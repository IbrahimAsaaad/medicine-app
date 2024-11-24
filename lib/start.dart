import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/features/Auth/login/persntation/view/screen/login.dart';
import 'package:medicine/features/home_page/persntation/view/screen/home_page.dart';

class GetStart extends StatelessWidget {
  const GetStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width.w,
        height: MediaQuery.of(context).size.height.h,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width.w,
                  height: MediaQuery.of(context).size.height.h,
                  decoration:  BoxDecoration(
                   color: Colors.blue.shade300
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width.w,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(40),),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/logo4.png",
                      scale: 0.9,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width.w,
                height: MediaQuery.of(context).size.height / 2.66,
                decoration:  BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width.w,
                height: MediaQuery.of(context).size.height / 2.66,
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                decoration:  BoxDecoration(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      //learning
                       const Text(
                        "Find Medicines",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          wordSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.h),
                        child:
                        //SubLearning
                        Text(
                          "Easily find Your perscirbed Medicines from a variety of registered pharmacies,no matter where you are",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h,),
                      // button
                      Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return const HomePage();
                            }));
                          },
                          child: Container(
                           width: 400,
                            height: 45.sp,
                            child:
                            // start
                             Center(
                               child: Text(
                                  " Get Started",
                                style: TextStyle(
                                  color: Colors.blue.shade300,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                            ),
                             ),
                          ),
                        ),
                      ),
                      SizedBox(height: 7.h,),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_){
                                return const Login_Page();
                              }));
                            },
                            child: Text("Continue as a guest",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),),
                          SizedBox(width: 20.w,),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
