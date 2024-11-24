import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/thheming/style.dart';
import '../../../../data/item_medicine.dart';
import '../../../manger/cart_cubit.dart';
import '../psh/Item_psh.dart';


class HairCare extends StatelessWidget {
  const HairCare({super.key});

  @override
  Widget build(BuildContext context) {
    List<ItemMedicine> items = [
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/hair.png",
        price: 250.0,
        title: "CLARY",
        subtitle: "Clary hair shampoo 300ml",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/hair2.png",
        price: 90.0,
        title: "ALee EVA",
        subtitle: "Aloe Eva Bath Cream is characterized by aloe vera, which helps to nourish and moisturize the hair, giving the hair a healthier and more vibrant appearance.",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/hair3.png",
        price: 25.5,
        title: "Vatika",
        subtitle: "Vatika anti-hair loss styling cream",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/hair4.png",
        price: 195.0,
        title: "PALMER'S",
        subtitle: "It nourishes the hair and scalp"
                "It soothes the scalp"
              "Helps moisturize hair",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/hair5.png",
        price: 295.0,
        title: "cantu",
        subtitle: "Cantu Care for Kids Detangling Conditioner Spray 177 ml",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/hair7.png",
        price: 195.5,
        title: "VITAL CARE",
        subtitle: "Vital gel transparent 300 ml",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/hair6.png",
        price: 200.0,
        title: "Seropipe",
        subtitle: "Seropipe spray is intended for weak, falling out and thin hair and is characterized by an advanced formula that works to nourish and moisturize the hair.",
      ),
    ];
    return  Scaffold(
      body: SafeArea(
        child: Container(
          decoration:  BoxDecoration(
              color: Colors.white,
          ),
          child: ListView(
            padding: EdgeInsets.all(15),
            children:  [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading:  const CircleAvatar(
                  backgroundImage: NetworkImage("https://i.pinimg.com/564x/4e/4c/4e/4e4c4e121824bcfb5b3fc267660a03f4.jpg"),
                  backgroundColor: Colors.white,
                  radius: 20,
                ),
                title: Text("HairCare",style: TextStyles.font18black54500weight,),
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
