import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/features/home_page/persntation/manger/cart_cubit.dart';
import 'package:medicine/features/home_page/persntation/view/screen/profile/search.dart';
import 'package:medicine/features/home_page/persntation/view/screen/settings/test.dart';
import '../widget/appbar_section.dart';
import '../widget/item_section.dart';
import 'cart/cart.dart';
import 'home_page.dart';
import 'nearby/nearby.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _currentIndex = 0;

  // Pages to be displayed based on the selected index
  final List<Widget> _pages = [
    const HomePage(),
    const Cart(),
    Profile(),
    const Settings(),
    const NearbyPharmacies(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff008FA0),
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blue.shade200,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                final hasItems = state.cartItems.isNotEmpty;
                return Badge(
                  isLabelVisible: hasItems,
                  backgroundColor: Colors.red.shade300,
                  offset: Offset(0, -10),
                  label: Text(state.cartItems.length.toString()),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.blue.shade200,
                  ),
                );
              },
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.blue.shade200,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.blue.shade200,
            ),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_hospital,
              color: Colors.blue.shade200,
            ),
            label: '',
          ),

        ],
      ),
    );
  }
}
