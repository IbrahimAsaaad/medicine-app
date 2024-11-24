import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/features/home_page/persntation/manger/homepage_cubit.dart';
import '../../../../../core/thheming/style.dart';
import 'custom_item_medicine.dart';
class ItemSection extends StatelessWidget {
  ItemSection({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomepageCubit, HomepageState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Column(
          children: [
            // label of item
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Item", style: TextStyles.font25blue500weight,),
                ],
              ),
            ),
            //spase
            SizedBox(height: 1.h),
            // list of image and text and icon item
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width
                  .w,
              height: 350.h,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: HomepageCubit.get(context).itemList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.w),
                      child: CustomItmeMadicine(
                        image: HomepageCubit.get(context).itemList[index].image!,
                        label: HomepageCubit.get(context).itemList[index].nameDart!,
                        dec: HomepageCubit.get(context).itemList[index].desc!,
                        type: HomepageCubit.get(context).itemList[index].type,
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