import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medicine/core/const1/constant.dart';
import 'package:medicine/myApp.dart';
import 'core/helpers/cached.dart';
 Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Constant.userId = CacheHelper.getData(key: "userId");
  print('My id is ==>> ${Constant.userId}');
  runApp(const MyApp());
}