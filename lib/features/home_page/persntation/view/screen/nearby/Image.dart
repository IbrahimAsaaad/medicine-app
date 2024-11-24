import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom.dart';

class ItemImage extends StatelessWidget {
   ItemImage({super.key,required this.dec,required this.label,required this.image});


  String image;
  String label;
  String dec;
  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
                width: 350.w,
                height: 200.h,
                fit: BoxFit.fill,
                image:
                const AssetImage('assets/images/imaget.png')),
          ),
          Custom(dec: dec, label: label, image: image),
        ],
      ),
    );
  }
}
