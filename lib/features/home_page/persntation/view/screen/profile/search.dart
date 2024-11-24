import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/features/home_page/persntation/view/screen/profile/infoname.dart';

import '../mainhomepage.dart';
//data
const url = "https://mehishivansingh.me";
const email = "Ibrahim2@gmail.com";
const phone = "0201016752703";
const location = " Mansoure , Egypt";


class Profile extends StatelessWidget {

   Profile({super.key,
    });
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Profile",
          style: TextStyle(
              fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade300
          ),)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_){
              return MainHomePage();
            }));
          },
          icon: Icon(Icons.chevron_left,color: Colors.black,),
        ),
        leadingWidth: 50.sp,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                style: IconButton.styleFrom(backgroundColor: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fixedSize:Size(70, 50),
                  elevation: 3,
                ),
                onPressed: (){},
                icon: Icon(Icons.check,color: Colors.white,)),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        minimum:  EdgeInsets.only(top: 120),
        child: Column(
          children: [
            // image
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/me2.jpg"),
            ),
            //name
             Text("ibrahim Asaad",style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w500,
              color: Colors.blue.shade300,
            ),),
            //job
             Text("Flutter Devepler",style: TextStyle(
              fontSize: 20,
              color: Colors.blue.shade300,
              letterSpacing: 1.5,
            ),),
            SizedBox(
              width: 200.sp,
              height: 20.sp,
              child:  Divider(
                indent: 1,
                color: Colors.black,
              ),
            ),
            // we will be creating a new widget name info
            InfoCard(
                icon:Icons.phone,
                text: phone,
            ),
            InfoCard(
              icon:Icons.web,
              text: url,
            ),
            InfoCard(
              icon:Icons.location_city,
              text: location,
            ),
            InfoCard(
              icon:Icons.email_outlined,
              text: email,
            ),
            SizedBox(height: 50.sp),
            Material(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(24),
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80,vertical: 15,),
                  child:
                  // start
                   Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.blue.shade300,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
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




