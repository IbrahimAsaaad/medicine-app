import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/features/home_page/persntation/view/screen/mainhomepage.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 80.sp,
        // leading: IconButton(
        //   onPressed: (){
        //     Navigator.push(context, MaterialPageRoute(builder: (_){
        //       return const RegisterPage();
        //     }));
        //   },
        //   icon: Icon(Icons.chevron_left,color: Colors.black,),
        // ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 120.sp),
            ClipRRect(
              child: Center(child: Image.asset("assets/images/order.png",width: 400.sp,height: 250.sp,)),
            ),
            SizedBox(height: 25.sp),
            Text("Order Success",style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            SizedBox(height: 5.sp),
            Text("your order will be sent to your address,",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black26,
              ),
            ),
            Text("thanks for order",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black26,
              ),
            ),
            SizedBox(height: 35.sp),
            Material(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(9),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_){
                    return MainHomePage();
                  }));
                },
                child: Container(
                  height: 40.sp,
                  width: 330.sp,
                  child:
                  // start
                  Center(
                    child: Text(
                      "Back to home",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
