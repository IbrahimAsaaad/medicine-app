import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/thheming/style.dart';
import 'Image.dart';

class Custom extends StatelessWidget {
   Custom({super.key,required this.dec,required this.label,required this.image,});

  String image;
  String label;
  String dec;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 380.sp,
          height: 120.sp,
          child: Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child:
                  Image(
                    image: AssetImage(image),
                    width: 100.sp,
                    height: 100.sp,
                    fit: BoxFit.fill,
                  ),

                ),
                Stack(
                   alignment: Alignment.bottomRight,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5.sp,vertical: 5.sp),
                      child: Column(
                        children: [
                          Text(label,style: TextStyles.font18black500weight,),
                          SizedBox(height: 5.sp),
                          Text(dec,style: TextStyles.font16black38500weight,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.fade,
                            softWrap: true,
                          ),
                           Padding(
                             padding: const EdgeInsets.only(right: 200),
                             child: TextButton(
                                 onPressed: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (_){
                                     return  ItemImage(dec: dec, label: label, image: image,);
                                   }));
                                 },
                                child: Text("5.6km")),
                           ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),

      ],
    );
  }
}
