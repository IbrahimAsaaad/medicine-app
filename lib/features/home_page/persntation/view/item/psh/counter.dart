import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../manger/cart_cubit.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CartCubit counterCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CartCubit,CartState>(
        builder: (context,state) {
          return Row(
            children: [
              buildBtn((){
                // counterCubit.increment();
              },  const Icon
                (
                Icons.add,size: 15,color: Colors.black,),() {
                // counterCubit.increment();
              }),
              // Text(state.counterValue.toString(),),
              buildBtn((){
                // counterCubit.decrement();
              },  const Icon
                (Icons.remove,size: 15,color: Colors.black,),() {
                // counterCubit.decrement();
              }),

            ],
          );
        }
    );
  }

  Widget buildBtn(Function myFunction,Icon icon,void Function()? onPressed) {
    return Container(
      width: 50.w,
      height: 30.h,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 3.h),disabledBackgroundColor: Colors.blue.shade100),
          onPressed: myFunction(),
          child: IconButton(
              onPressed: onPressed,icon: icon),
        ),
      ),
    );
  }
}