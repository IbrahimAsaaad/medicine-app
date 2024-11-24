import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/thheming/style.dart';
import '../psh/counter.dart';

class ItemBorder extends StatefulWidget {
  final String title, image, price,subtitle,Abb;
  const ItemBorder({super.key,required this.image,required this.price,required this.title,required this.subtitle,required this.Abb});

  @override
  State<ItemBorder> createState() => _ItemBorderState();
}
class _ItemBorderState extends State<ItemBorder> {
  bool selected = false;
  int value = 0 ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white70,
          boxShadow:  [
            BoxShadow(
              offset: Offset(0, 5),
              color: Theme.of(context).colorScheme.primary.withOpacity(.2),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ]
      ),
      child:  Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(widget.image,height: 100.h,width: 100.w,fit: BoxFit.fill,),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(widget.title,style: TextStyles.font20black500weight,),
                SizedBox(height: 5.h),
                Text(widget.subtitle,style: TextStyles.font14black38300weight,),
                Row(
                  children: [
                    Text(widget.price,style: TextStyles.font18red200400weight,),
                    Text(widget.Abb,style: TextStyles.font14black100weight,),
                  ],
                ),

                SizedBox(height: 10.h),
                InkWell(

                  onTap: (){
                    selected=!selected;
                    setState(() {
                    });
                  },
                  child:selected==false?
                  Container(
                    width: 40.w,
                    height: 30.h,
                    child: ElevatedButton(
                      onPressed: () {
                        selected=!selected;
                        setState(() {

                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade50,
                          foregroundColor: Colors.white),
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(color: Colors.red.shade200),
                      ),
                    ),
                  ): const CounterWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
