import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:medicine/features/home_page/persntation/manger/cart_cubit.dart';
import 'package:medicine/features/home_page/persntation/view/screen/cart/cart_item.dart';

import '../mainhomepage.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child:
        Text("My Cart",style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black
        ),)),
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_){
              return MainHomePage();
            }));
          },
          icon: Icon(Icons.chevron_left,color: Colors.black,),
        ),
        actions: [
          // IconButton(
          //     onPressed: (){},
          //     icon:Icon(Icons.menu,color: Colors.white,)
          // ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 40.sp,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return  ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: state.cartItems.length,
            itemBuilder: (context, index) =>
                CartItem(
                  itemMedicine: state.cartItems[index],
                ),

          );
        },
      ),
    );
  }
}
