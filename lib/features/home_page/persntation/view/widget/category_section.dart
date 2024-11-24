import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/features/home_page/persntation/manger/homepage_cubit.dart';
import 'package:medicine/features/home_page/persntation/view/screen/favourite_screen.dart';
import '../../../../../core/thheming/style.dart';
import 'custom_item_category.dart';
class CategorySection extends StatelessWidget {
  CategorySection({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomepageCubit, HomepageState>(
      buildWhen:(previous, current) =>  true,
      listener: (context, state) {
      },
      builder: (context, state) {
        return Column(
          children: [
            //spase
            SizedBox(height: 1.h),
            // label Category
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Category", style: TextStyles.font25blue500weight,),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return const FavouriteScreen();
                      }));
                      HomepageCubit.get(context).getFavourite();
                    },
                    child:  Icon(Icons.favorite_outlined,color: Colors.grey.shade200,),
                  ),
                ],
              ),
            ),
            // list of image and text and icon Category
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width
                  .w,
              height: 120.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: HomepageCubit.get(context).categoryList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: CustomCategoryMedicine(
                        nameCategory:HomepageCubit.get(context).categoryList[index].label! ,
                        image: HomepageCubit.get(context).categoryList[index].image!,
                        id: HomepageCubit.get(context).categoryList[index].id!,
                      ),
                    );
                  }
              ),
            ),
          ],
        );
      },
    );
  }
}