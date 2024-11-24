import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/features/home_page/persntation/view/screen/mainhomepage.dart';

class Location extends StatelessWidget {
  const Location({super.key});

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
        actions: [
          TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_){
                  return MainHomePage();
                }));
              },
              child: Text("Skip",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w500),)),
        ],
      ),
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 150.sp),
           ClipRRect(
               child: Center(child: Image.asset("assets/images/loaction.png",width: 250.sp,height: 200.sp,)),
           ),
            SizedBox(height: 35.sp),
            Text("Access to your location",style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            SizedBox(height: 5.sp),
            Text("We need to acess your location to shwo you  ",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black26,
            ),
            ),
            Text("departments and groups near you and public",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black26,
              ),
            ),
            Text("incidents that may ocurr around you.",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black26,
              ),
            ),
            SizedBox(height: 35.sp),
            Material(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                onTap: (){},
                child: Container(
                  height: 40.sp,
                  width: 350.sp,
                  child:
                  // start
                  Center(
                    child: Text(
                      "Allow Location",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
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








