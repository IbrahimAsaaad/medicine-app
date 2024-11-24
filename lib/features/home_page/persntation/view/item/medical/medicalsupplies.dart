import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/thheming/style.dart';
import '../../../../data/item_medicine.dart';
import '../../../manger/cart_cubit.dart';
import '../psh/Item_psh.dart';


class MedicalSupplies extends StatelessWidget {
  const MedicalSupplies ({super.key});

  @override
  Widget build(BuildContext context) {
    List<ItemMedicine> items = [
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/medical1.png",
        price: 15.5,
        title: "Sodium salt solution",
        subtitle: "Sodium chloride salt solution 0.9%_500ml",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/medical2.png",
        price: 40.0,
        title: "Thermometer",
        subtitle: "A mercury thermometer is a thin glass tube with a silver tip containing mercury. It is characterized by an accurate standard for temperature.",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/medical3.png",
        price: 8.5,
        title: "Cotten",
        subtitle: "Medical cotton_50g",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/medical4.png",
        price: 3.5,
        title: "Injection",
        subtitle: "Injection",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/medical5.png",
        price: 450.5,
        title: "One Touch",
        subtitle: "It is characterized by its accuracy in measuring blood sugar levels, and is characterized by its small size and ease of use",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/medical6.png",
        price: 57.5,
        title: "Silk Plast",
        subtitle: "Silkplast_medical adhesive silk tape_10cm",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/medical7.png",
        price: 80.5,
        title: "They left us",
        subtitle: "Septona_2-layer round cotton bandages_70 pieces",
      ),
    ];
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
                  backgroundImage: NetworkImage("https://i.pinimg.com/564x/9a/c6/d5/9ac6d5598ec422143b85eecbbd88f20b.jpg"),
                  backgroundColor: Colors.white,
                  radius: 25,
                ),
                title: Text("MedicalSupplies",style: TextStyles.font18black54500weight,),
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

              //       title: "They left us",
              //       subtitle: "Septona_2-layer round cotton bandages_70 pieces",
              //     ),
              //     SizedBox(height: 15.h),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
