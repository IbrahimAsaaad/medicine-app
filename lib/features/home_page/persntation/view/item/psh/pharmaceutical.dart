import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/core/thheming/style.dart';

import '../../../../data/item_medicine.dart';
import '../../../manger/cart_cubit.dart';
import 'Item_psh.dart';

class PHS extends StatelessWidget {
  const PHS({super.key ,});
  @override
  Widget build(BuildContext context) {
    List<ItemMedicine> items = [
      ItemMedicine(
        id: "${DateTime.now().microsecondsSinceEpoch}Bo6ppwnDW6Mt81oZjN2y",
        Abb: "EGP",
        image: "assets/images/test.png",
        price: 50.0,
        title: "Panadol Extra",
        subtitle: "Panadol Extra Extra Effective Pain and Fever Relief /24Tablets",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/test1.png",
        price: 28.5,
        title: "Doliprane",
        subtitle: "Dolperan 1000, each tablet contains 1000 mg of paracetamol, and it works to relieve pain, reduce fever, and get rid of the monster headache with one pill",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/test2.png",
        price: 66.0,
        title: "BRUFEN",
        subtitle: "Brufen/6000Mg/30tablet",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/test3.png",
        price: 50.5,
        title: "Panadol ColD_FlU",
        subtitle: "Panol / Cold Flu Day is an effective treatment for cold and flu symptoms, 24 tablets",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/test4.png",
        price: 67.0,
        title: "Panadol Joint",
        subtitle: "Panadol Joint to relieve joint pain / 24 tablets. The tablets provide relief from pain resulting from arthritis for up to 8 hours.",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/test5.png",
        price: 105.5,
        title: "Telfast 180Mg",
        subtitle: "Telfast 180 mg is one of the best allergy medications, as it relieves annoying allergy symptoms such as runny nose, runny nose, and skin redness.",
      ),
      ItemMedicine(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        Abb: "EGP",
        image: "assets/images/test.png",
        price: 76.0,
        title: "Tefast 120Mg",
        subtitle: "Telfast 120 mg is one of the best allergy medications, as it relieves annoying allergy symptoms such as runny nose, runny nose, and redness of the skin. The recommended dose is for adults and children aged 12 years or older.",
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
                    backgroundImage: AssetImage("assets/images/logo2.png"),
                    backgroundColor: Colors.white,
                    radius: 25,
                  ),
                  title: Text("Pharmaceutical",style: TextStyles.font18black54500weight,),
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



