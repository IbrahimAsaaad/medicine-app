import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/features/home_page/persntation/view/screen/profile/search.dart';
import 'package:medicine/features/home_page/persntation/view/screen/settings/settings_items.dart';
import 'package:medicine/features/home_page/persntation/view/screen/settings/switch.dart';
import '../mainhomepage.dart';


class Settings extends StatefulWidget {
  
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_){
              return  const MainHomePage();
            }));
          },
          icon: Icon(Icons.chevron_left,color: Colors.black,),
        ),
        leadingWidth: 80.sp,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text
                ("Settings",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black
              ),),
              SizedBox(height: 40.sp),
              const Text("Account",style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black
              ),),
              SizedBox(height: 20.sp),
              Container(
                width: double.infinity.sp,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image(image: AssetImage("assets/images/me2.jpg"),
                        width: 60.sp,
                        height: 60.sp,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20.sp),
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ibrahim Asaad",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        ),
                        SizedBox(height: 4.sp),
                        Text("Flutter Devepler",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 60.sp,
                      height: 60.sp,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                      ),
                      child: IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_){return Profile();}));
                        },
                        icon: Icon(Icons.chevron_left),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.sp),
              Text
                ("Settings",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black
              ),),
              SizedBox(height: 20.sp),
              SettingsItem(
                  title: "Notifications",
                  bgColor: Colors.blue.shade100,
                  iconColor: Colors.blue,
                  onTap: (){},
                  icon:Icons.notifications,
              ),
              SizedBox(height: 10.sp),
              SettingsItem(
                title: "Language",
                bgColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                onTap: (){},
                icon:Icons.language ,
                value: "Arabic",
              ),
              SizedBox(height: 10.sp),
              SettingsItem(
                title: "Help",
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: (){},
                icon:Icons.help,
              ),
              SizedBox(height: 10.sp),
              SettingsStwting(
                  title:"Dark Mode" ,
                  bgColor: Colors.purple.shade100,
                  iconColor: Colors.purple,
                  icon:Icons.dark_mode_outlined ,
                  onTap: (value){
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                  value2:isDarkMode, 
              ),
              SizedBox(height: 10.sp),
            ],
          ),
        ),
      ),
     );
  }
}














