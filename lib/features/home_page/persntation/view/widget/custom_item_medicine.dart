
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/core/helpers/category_type.dart';
import 'package:medicine/features/home_page/persntation/view/item/daily/dailycare.dart';
import 'package:medicine/features/home_page/persntation/view/item/hiar/hair%20Care.dart';
import 'package:medicine/features/home_page/persntation/view/item/medical/medicalsupplies.dart';
import 'package:medicine/features/home_page/persntation/view/item/mother/mother%20and%20child.dart';
import 'package:medicine/features/home_page/persntation/view/item/psh/pharmaceutical.dart';
import '../../../../../core/thheming/style.dart';

class CustomItmeMadicine extends StatelessWidget {
  CustomItmeMadicine({
    super.key,
    required this.image,
    required this.label,
    required this.dec,
    required this.type,
  });

  String image;

  String label;

  String dec;

  CategoryType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 350.w,
          height: 140.h,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            color: Colors.blue.shade200,
            child: Row(
              children: [
                // image Item
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image(
                    width: 170.w,
                    height: 150.h,
                    image: NetworkImage(image),
                    fit: BoxFit.fill,
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 7.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            label,
                            style: TextStyles.font20white500weight,
                          ),
                          //spase
                          SizedBox(height: 5.h),
                          // text image
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: SizedBox(
                              width: 120.w,
                              child: Text(
                                dec,
                                style: TextStyles.font16white38500weight,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.fade,
                                softWrap: true,
                              ),
                            ),
                          ),
                          //spase
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        switch (type) {
                          case CategoryType.unKnown:
                            break;
                          case CategoryType.pharmaceutical:
                            print(":::::::::::::::::Pharmacy");
                             Navigator.push(context, MaterialPageRoute(builder: (_){
                               return const PHS();
                             } ));
                            break;
                          case CategoryType.hairCare:
                            print(":::::::::::::::::HairCare");
                             Navigator.push(context, MaterialPageRoute(builder: (_){
                               return  const HairCare();
                             }));
                            break;
                          case CategoryType.medicalSupplies:
                            print(":::::::::::::::::MedicalSupplies");
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return const MedicalSupplies();
                            }));
                            break;
                          case CategoryType.motherAndChild:
                            print(":::::::::::::::::Mother and Child");
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return  MotherandChild();
                            }));
                            break;
                          case CategoryType.dailyCare:
                            print(":::::::::::::::::DailyCare");
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return const DailyCare();
                            }));
                            break;
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 7.w,),
                        child:  Icon(
                          Icons.shopping_cart_checkout_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
