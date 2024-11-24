import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/thheming/style.dart';
import '../../../../data/item_medicine.dart';
import '../../../manger/cart_cubit.dart';
import '../psh/Item_psh.dart';



class MotherandChild extends StatelessWidget {
    MotherandChild({super.key});
  List<ItemMedicine> items = [
    ItemMedicine(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      Abb: "EGP",
      image: "assets/images/mo1.png",
      price: 120.0,
      title: "Pendoline",
      subtitle: "Pendoline shampoo for children 250 ml",
    ),
    ItemMedicine(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      Abb: "EGP",
      image: "assets/images/mo2.png",
      price: 315.0,
      title: "BabyJoy",
      subtitle: "Baby Joy diapers are specially absorbent to suit children's skin and give a feeling of comfort and softness that lasts all the time.",
    ),
    ItemMedicine(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      Abb: "EGP",
      image: "assets/images/mo3.png",
      price: 33.0,
      title: "Heio Baby",
      subtitle: "An advanced formula rich in cow's milk and supported by the necessary nutritional elements for the chil",
    ),
    ItemMedicine(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      Abb: "EGP",
      image: "assets/images/mo4.png",
      price: 400.0,
      title: "Molfix pants",
      subtitle: "Molfix Baby Pants Diapers Extra Large Size 6_48 Pieces",
    ),
    ItemMedicine(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      Abb: "EGP",
      image: "assets/images/mo5.png",
      price: 136.33,
      title: "Pampers",
      subtitle: "Diapers are made of soft materials that gently wrap around your baby's skin to give him a soft feeling",
    ),
    ItemMedicine(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      Abb: "EGP",
      image: "assets/images/mo6.png",
      price: 66.6,
      title: "Molfix",
      subtitle: "Molfix diapers for newborns, diaper size 2",
    ),
    ItemMedicine(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      Abb: "EGP",
      image: "assets/images/mo7.png",
      price: 360.0,
      title: "Fine Baby",
      subtitle: "Fine Baby Baby Maxi Diapers Designed with Improved Double Leakage Barriers, 58 Pieces",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          decoration:  BoxDecoration(
              color: Colors.white
          ),
          child: ListView(
            padding: EdgeInsets.all(15),
            children:  [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage("https://i.pinimg.com/564x/9a/fd/2b/9afd2b874ae9c210bc53e06918484216.jpg"),
                  backgroundColor: Colors.white,
                  radius: 25,
                ),
                title: Text("MotherandChild",style: TextStyles.font18black54500weight,),
                trailing: const Icon(Icons.notification_add_sharp,size: 30,),

              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        color: Theme.of(context).colorScheme.primary.withOpacity(.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                      )
                    ]
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search for a product",
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                    border: InputBorder.none,
                    prefixIcon: Icon(CupertinoIcons.search,color: Colors.grey,),
                  ),
                ),
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return Column(
                    children: items
                        .map(
                          (item) => ItemBorder(
                        itemMedicine: item,
                        addedToCart: context
                            .read<CartCubit>()
                            .checkIsAddedToCart(item),
                      ),
                    )
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
