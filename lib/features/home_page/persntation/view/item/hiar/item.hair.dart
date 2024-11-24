
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/core/thheming/style.dart';
import 'package:medicine/features/home_page/data/item_medicine.dart';
import '../../../manger/cart_cubit.dart';
class ItemBorder extends StatelessWidget{
  final bool addedToCart;
  final ItemMedicine itemMedicine;

  const ItemBorder({
    super.key,
    required this.itemMedicine,
    required this.addedToCart,
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
                Container(
                  width: 40.w,
                  height: 30.h,
                  child: ElevatedButton(
                    onPressed: () {
                      final cartCubit = context.read<CartCubit>();
                      if(addedToCart){
                        //delete
                        cartCubit.deleteItem(itemMedicine);
                      }else{
                        cartCubit.addItem(itemMedicine);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade50,
                        foregroundColor: Colors.white),
                    child: Text(
                      addedToCart ? "Remove From Cart" : "Add To Cart",
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
