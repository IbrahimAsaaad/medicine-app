import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/features/home_page/data/item_medicine.dart';
import 'package:medicine/features/home_page/persntation/manger/cart_cubit.dart';

import '../../../../../../core/thheming/style.dart';
import '../psh/Item_psh.dart';

class DailyCare extends StatelessWidget {

  const DailyCare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<ItemMedicine> items = [
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/daily1.png",
        price: 150.0,
        title: "NIVEA",
        subtitle: "Nivea & Protect & Care Stick Deodorant for Women /40 ml",
      ),
      ItemMedicine(
        id: "${DateTime.now().microsecondsSinceEpoch}123",
        Abb: "EGP",
        image: "assets/images/daily2.png",
        price: 30.0,
        title: "NIVEA Soft",
        subtitle: "An intense moisturizing cream that is highly effective, quickly absorbed and refreshes the skin",
      ),
      ItemMedicine(
        id: "${DateTime.now().microsecondsSinceEpoch}123",
        Abb: "EGP",
        image: "assets/images/daily3.png",
        price: 269.0,
        title: "Bepanthen",
        subtitle: "Bepanthen Lotion for the face and body moisturizes and soothes the skin, and its special formula maintains skin moisture",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/daily.png",
        price: 100.0,
        title: "FA",
        subtitle: "Fa men sport spray 200 ml",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/daily4.png",
        price: 1199.0,
        title: "VICHY",
        subtitle: "Vichy LiftActiv Collagen Specialist Wrinkle Cream 50 ml",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/daily5.png",
        price: 1099.0,
        title: "VICHY V",
        subtitle: "Vichy Mineral 89 Hyaluronic Acid Facial Moisturizer - 50ml",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/daily6.png",
        price: 23.5,
        title: "Dettol",
        subtitle: "Dettol Anti-Bacterial Soap Original - 165 gm",
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration:  BoxDecoration(color: Colors.white),
          child: ListView(
            padding: EdgeInsets.all(15),
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i.pinimg.com/564x/49/9c/f3/499cf330b612c941031b4216fc397e68.jpg"),
                  backgroundColor: Colors.white,
                  radius: 25,
                ),
                title: Text(
                  "DailyCare",
                  style: TextStyles.font18black54500weight,
                ),
                trailing: const Icon(
                  Icons.notification_add_sharp,
                  size: 30,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                      )
                    ]),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search for a product",
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: Colors.grey,
                    ),
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
