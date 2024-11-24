import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/core/const1/constant.dart';
import 'package:medicine/features/Auth/login/persntation/view/screen/login.dart';
import 'package:medicine/features/home_page/persntation/manger/cart_cubit.dart';
import 'package:medicine/features/home_page/persntation/manger/homepage_cubit.dart';
import 'package:medicine/features/home_page/persntation/view/screen/home_page.dart';
import 'package:medicine/start.dart';

import 'core/firebase/firestore_service.dart';
import 'features/Auth/login/persntation/manger/Auth_cubit.dart';
import 'features/home_page/persntation/view/screen/mainhomepage.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(380, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=> AuthCubit(FireStoreService())),
          BlocProvider(create: (context)=> HomepageCubit(FireStoreService())..getCategory()..getItem()..getFavourite()),
          BlocProvider(create: (context)=> CartCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:  Constant.userId == null ?const GetStart(): const MainHomePage(),
        ),
      ),
    );
  }
}
