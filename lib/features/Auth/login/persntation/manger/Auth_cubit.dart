
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine/core/firebase/firestore_service.dart';
import 'package:medicine/core/helpers/cached.dart';
import 'package:medicine/features/home_page/persntation/view/screen/home_page.dart';
import 'package:medicine/features/home_page/persntation/view/screen/mainhomepage.dart';
import 'package:meta/meta.dart';

part 'Auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.fireStoreService) : super(LoginInitial());

  // line for calling
  static AuthCubit get(context)=> BlocProvider.of(context);
  CollectionReference userData =
       FirebaseFirestore.instance.collection("UserData");
  FireStoreService fireStoreService ;

  Future<void> loginFunction({
    required String email,
    required String password,
    required BuildContext ctx,

})async

  {
    try{
      emit(LoginLoading());
      UserCredential userCredential  =  await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      var loginUid = userCredential.user!.uid ;

      if (loginUid.isNotEmpty)
      {
        CacheHelper.saveData(key: "userId", value: loginUid);
        Navigator.push(ctx, MaterialPageRoute(builder: (_)
        {
          return const HomePage();
        }));
        emit(LoginSuccess());
      }
    }
        catch(error)
    {
      emit(LoginError());
      print(error);
    }
      }

  Future<void> registerFunction({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String address,

  }
    ) async
  {
    try{
      emit(RegisterLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) async {
        emit(RegisterSuccess());
        await fireStoreService.setDoc(
          model: {
            "email":email,
            "password":password,
            "phone":phone,
            "firstName":firstName,
            "lastName":lastName,
            "address":address,
          },
          uId: FirebaseAuth.instance.currentUser!.uid,
          collectionReference: userData,
        );

        emit(DataSuccess());
      });
    }
        catch(erorr)
    {
      emit(RegisterError());
      print(erorr);
    }
  }




}



