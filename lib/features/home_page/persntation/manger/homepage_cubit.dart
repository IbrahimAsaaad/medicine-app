import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine/core/firebase/firestore_service.dart';
import 'package:medicine/features/home_page/data/category_model.dart';
import 'package:medicine/features/home_page/data/item_model.dart';
import 'package:meta/meta.dart';

import '../../../../core/const1/constant.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  HomepageCubit(this.fireStoreService) : super(HomepageInitial());

  // calling
 static HomepageCubit get(context)=> BlocProvider.of(context);
  // get function
  FireStoreService fireStoreService;

  CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection('category');

  CollectionReference itemCollection =
  FirebaseFirestore.instance.collection('item');

// list Cat
  List<CategoryModel> categoryList = [];
  List<CategoryModel> favouriteList = [];
  // list Item
  List<ItemModel> itemList = [];

  Future<dynamic> getCategory()async
  {
    emit(CategoryLoading());
    try{
      await fireStoreService.getCollection(collectionReference:categoryCollection).then((value){

        categoryList = [];

        for (var doc in value.docs)
        {
          categoryList.add(CategoryModel.fromJson(doc as QueryDocumentSnapshot<Map<String,dynamic>>));

          print("All Done");
          emit(CategorySuccess());
        }
      });
    }
        catch(error){

      print("error");

      emit(CategoryError());
        }
  }

  Future<dynamic> getItem()async{
    emit(ItemLoading());
    try{
      await fireStoreService.getCollection(collectionReference: itemCollection).then((value) {
        itemList =[];
        for(var doc in value.docs)
        {
          itemList.add(ItemModel.fromJson(doc as QueryDocumentSnapshot <Map<String,dynamic>>));

        }
        emit(ItemSuccess());
        print("Item Done");
      });
    }
        catch(error)
    {
      print(error);
      emit(ItemError());
    }
  }
// fav
  Future<dynamic> getFavourite()async
  {
    emit(GetFavouriteLoading());
   try
       { await FirebaseFirestore.instance.collection("UserData").doc(Constant.userId).collection("Favourite").get().then((value) {
         favouriteList = [];
         for(var doc in value.docs)
         {
           favouriteList.add(CategoryModel.fromJson(doc));
         }
       });
       emit(GetFavouriteSuccess());
       }

   catch(error)

    {
      print(error);
      emit(GetFavouriteError());
    }
  }



}
