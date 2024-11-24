import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medicine/features/home_page/persntation/manger/homepage_cubit.dart';
import 'package:medicine/features/home_page/persntation/view/screen/home_page.dart';

import '../../../../../core/thheming/style.dart';
import '../../../data/category_model.dart';
import '../screen/favourite_screen.dart';

class CustomCategoryMedicine extends StatefulWidget {
  CustomCategoryMedicine({
    super.key,
    required this.nameCategory,
    required this.image,
    required this.id,
  });

  final String id;
  final String image;
  final String nameCategory;

  @override
  State<CustomCategoryMedicine> createState() => _CustomCategoryMedicineState();
}

class _CustomCategoryMedicineState extends State<CustomCategoryMedicine> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageCubit, HomepageState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        final bool isFav = context
            .read<HomepageCubit>()
            .favouriteList
            .any((element) => element.uid == widget.id);

        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // image
            Container(
              width: 170.w,
              height: 120.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // text
            Container(
              width: 170.w,
              decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.nameCategory,
                      style: TextStyles.font16black38500weight,
                    ),
                    //spase
                    SizedBox(height: 7.h),
                    GestureDetector(
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection("UserData")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection("Favourite")
                              .add({
                            "image": widget.image,
                            "label": widget.nameCategory,
                            "uid": widget.id,
                          }).then((value) {
                            HomepageCubit.get(context)
                                .favouriteList
                                .add(CategoryModel(
                                  label: widget.nameCategory,
                                  image: widget.image,
                                  id: widget.id,
                                ));
                            HomepageCubit.get(context)
                                .emit(GetFavouriteSuccess());
                            HomepageCubit.get(context).getFavourite();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return const FavouriteScreen();
                            }));

                            Fluttertoast.showToast(
                                msg: "This item is add in Favourite",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          });
                        },
                        child: Icon(
                          Icons.favorite,
                          size: 25,
                          color: !isFav ? Colors.white : Colors.red,
                        )),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
