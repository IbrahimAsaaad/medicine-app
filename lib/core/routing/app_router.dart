import 'package:flutter/material.dart';
import 'package:medicine/core/routing/routes.dart';
import 'package:medicine/features/onBoarding/presntation/on_boarding.dart';

import '../../features/Auth/login/persntation/view/screen/login.dart';

class AppRouter
{
  Route generaRoute(RouteSettings settings) {
    switch (settings.name) {
    case Routes.onBoardingScreen:
    return MaterialPageRoute(builder: (_) {
    return OnBoardingScreen();
    }
    );
    case Routes.loginScreen:
    return MaterialPageRoute(builder: (_) {
    return  Login_Page();
    }
    );

      default :
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(child: Text('No Route Found ${settings.name}'),),
          );
        });

  //  case Routes.registerScreen:
   // return MaterialPageRoute(builder: (_) {
   // return const Register_Page();


    }
  }
}