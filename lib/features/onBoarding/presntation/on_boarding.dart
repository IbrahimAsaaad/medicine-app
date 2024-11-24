import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/core/thheming/color.dart';
import 'package:medicine/core/thheming/style.dart';
import 'package:medicine/features/onBoarding/presntation/widget/custom_item_page_view.dart';
import 'package:medicine/start.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Auth/login/persntation/view/screen/login.dart';
import '../data/model.dart';





class OnBoardingScreen extends StatefulWidget {
   OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();

  bool islast = false;

  void submit(BuildContext context)
  {
    //isLast become ture
    Navigator.push(context, MaterialPageRoute(builder: (_){
      return  const GetStart();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 680.h,
                  child: PageView.builder(
                      onPageChanged: (int index){
                        if (index == boarding.length-1){
                          setState(() {
                            islast = true ;
                          });
                        }
                      },
                    controller: pageController,
                     itemCount:boarding.length ,
                      physics: BouncingScrollPhysics(),
                      itemBuilder:(context,index)
                      {
                        return  OnBoardingItem(
                            image: boarding[index].image,
                            title: boarding[index].title,
                            snbTitle: boarding[index].body,
                        );
                      }
                  ),
                ),
                SizedBox(height: 25.h),
                Row(
                  children: [
                    SmoothPageIndicator(
                      effect:  const ExpandingDotsEffect(
                        dotColor: Colors.black12,
                        activeDotColor: Colors.black12,
                        dotHeight: 8,
                        dotWidth: 10,
                        expansionFactor: 4,
                        spacing: 5,
                      ),
                      controller: pageController,
                      count: boarding.length,
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      backgroundColor: Colors.grey,
                      onPressed: (){
                        if (islast){
                          submit(context);
                        }else{
                          pageController.nextPage(
                            duration:const Duration(
                              milliseconds: 700,
                            ) ,
                            curve:Curves.fastLinearToSlowEaseIn,
                          );
                        }
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ) ,
      ),
    );
  }
}


