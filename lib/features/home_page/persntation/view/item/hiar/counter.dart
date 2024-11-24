import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../manger/cart_cubit.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CartCubit counterCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CartCubit, CartState>(
      // buildWhen: (previous, current) =>
      //     previous.counterValue != current.counterValue,
      builder: (context, state) {
        return Row(
          children: [
            buildBtn(
              const Icon(
                Icons.add,
                size: 15,
                color: Colors.white,
              ),
              () {},
              // counterCubit.increment,
            ),
            // Text(state.counterValue.toString()),
            buildBtn(
              const Icon(
                Icons.remove,
                size: 15,
                color: Colors.white,
              ),
              () {},
              // state.counterValue == 0 ? null : counterCubit.decrement,
            ),
          ],
        );
      },
    );
  }

  Widget buildBtn(Icon icon, void Function()? onPressed) {
    return Container(
      width: 100.w,
      height: 40.h,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: 3.h,
            ),
            disabledBackgroundColor: Colors.blue.shade100,
          ),
          onPressed: onPressed,
          child: icon,
        ),
      ),
    );
  }
}
