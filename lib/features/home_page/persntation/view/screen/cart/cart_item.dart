
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/core/thheming/style.dart';
import 'package:medicine/features/home_page/data/item_medicine.dart';
import 'package:medicine/features/home_page/persntation/manger/cart_cubit.dart';

import 'checkout.dart';


class CartItem extends StatelessWidget {
  final ItemMedicine itemMedicine;

  const CartItem({
    super.key,
    required this.itemMedicine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Theme.of(context).colorScheme.primary.withOpacity(.2),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ]),
      child: Row(
        children: [
          if (itemMedicine.image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                itemMedicine.image!,
                height: 100.h,
                width: 100.w,
                fit: BoxFit.fill,
              ),
            )
          else
            SizedBox(
              height: 100.h,
              width: 100.w,
            ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  itemMedicine.title,
                  style: TextStyles.font20black500weight,
                ),
                SizedBox(height: 5.h),
                if (itemMedicine.subtitle != null)
                  Text(
                    itemMedicine.subtitle!,
                    style: TextStyles.font14black38300weight,
                  ),
                Row(
                  children: [
                    Text(
                      itemMedicine.price.toString(),
                      style: TextStyles.font18red200400weight,
                    ),
                    if (itemMedicine.Abb != null)
                      Text(
                        itemMedicine.Abb!,
                        style: TextStyles.font14black100weight,
                      ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    buildBtn(
                      const Icon(
                        Icons.add,
                        size: 15,
                        color: Colors.black,
                      ),
                      () => context.read<CartCubit>().addItem(itemMedicine),
                    ),
                    Text(itemMedicine.quantity.toString()),
                    buildBtn(
                      const Icon(
                        Icons.remove,
                        size: 15,
                        color: Colors.black,
                      ),
                      itemMedicine.quantity == 1
                          ? null
                          : () => context
                              .read<CartCubit>()
                              .decrementQty(itemMedicine),
                    ),
                  ],
                ),
                SizedBox(height: 7.h),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 70.sp,
                      height: 30.h,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<CartCubit>().deleteItem(itemMedicine);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blue.shade50),
                        child:  Center(
                          child: (
                            Icon(Icons.delete,size: 30,color: Colors.blue.shade100,)

                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40.sp),
                    Container(
                      width: 70.sp,
                      height: 25.h,
                      child: ElevatedButton(
                        onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (_){
                           return CheckOut();
                         }));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.white),
                        child:  (
                            Text("Order",style: TextStyle(
                                color: Colors.blue.shade100,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp

                            ),)
                        ),
                      ),
                    ),

                  ],

                ),
              ],
            ),

          ),
        ],
      ),
    );
  }

  Widget buildBtn(Icon icon, void Function()? onPressed) {
    return Container(
      width: 100.w,
      height: 30.h,
      child: Padding(
        padding: EdgeInsets.only(left: 20.sp,right: 20.sp),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 3.h),
            disabledBackgroundColor: Colors.white,
            backgroundColor: Colors.white
          ),
          onPressed: onPressed,
          child: icon,
        ),
      ),
    );
  }
}
