import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medicine/core/const1/constant.dart';
import 'package:medicine/features/home_page/persntation/manger/homepage_cubit.dart';

import '../../../../../core/thheming/style.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomepageCubit, HomepageState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: HomepageCubit.get(context).favouriteList.length,
                          itemBuilder:(context,index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200.w,
                              height: 250.h,
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white70,
                              ),
                              child: Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      // image
                                      Container(
                                        width:170.w,
                                        height: 200.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(24),
                                          child:  Image(
                                            image:NetworkImage(HomepageCubit.get(context).favouriteList[index].image!),
                                            fit: BoxFit.fill,

                                          ),
                                        ),
                                      ),
                                      // text
                                      Container(
                                        width: 170.w,
                                        decoration: const BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:Radius.circular(24),
                                            bottomRight: Radius.circular(24),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(vertical: 5.h),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(HomepageCubit.get(context).favouriteList[index].label!,style: TextStyles.font16black38500weight,),

                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Image(
                                          width: 170.w,
                                          height: 190.h,
                                          fit: BoxFit.fill,
                                          image: const AssetImage("assets/images/sp.jpg")
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: (){
                                          FirebaseFirestore.instance.collection("UserData").doc(Constant.userId).collection("Favourite").
                                          doc(HomepageCubit.get(context).favouriteList[index].id).delete().then((value) {
                                            HomepageCubit.get(context).getFavourite();
                                            Fluttertoast.showToast(
                                                msg: "Delete Done",
                                                toastLength: Toast.LENGTH_LONG,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.blue.shade300,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );
                                          });
                                        },
                                        child:
                                        Padding(
                                          padding:  EdgeInsets.only(bottom: 15.h),
                                          child: const Icon(
                                            Icons.delete,
                                            size: 30,
                                            color: Colors.red,
                                            
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          );
                          }
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
