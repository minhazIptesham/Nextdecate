import 'package:flutter/material.dart';

import '../modules/account_settings/views/account_settings_view.dart';
import '../modules/product_cart/views/product_cart_view.dart';
import '../modules/product_categories/views/product_categories_view.dart';
import '../modules/product_wishlist/views/product_wishlist_view.dart';



class BottonNavigationBarPage extends StatefulWidget {
  const BottonNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<BottonNavigationBarPage> createState() =>
      _BottonNavigationBarPageState();
}

class _BottonNavigationBarPageState extends State<BottonNavigationBarPage> {
  int _selectIndex = 2;

  void _navigationBottonBar(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  final List<Widget> _pages = const[
     ProductCategoriesView(),
    ProductWishlistView(),
    ProductWishlistView(),
    ProductCartView(),
    AccountSettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Color.fromARGB(255, 4, 4, 4),
        unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 10),
        showSelectedLabels: true,
        selectedIconTheme: IconThemeData(size: 30),
        showUnselectedLabels: true,
        backgroundColor: Colors.blue,
        currentIndex: _selectIndex,
        onTap: _navigationBottonBar,
        items:  [
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Wishlist"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Stack(children:[
                 Text('0'),
                Icon(Icons.add_shopping_cart_outlined)] ), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Account"),
        ],
      ),
    );
  }
}

// // Group: Group 226

// // Group: Group 24
//       Text(
//     'Category',
//     style: GoogleFonts.roboto(
//       fontSize: 12.0,
//       color: const Color(0xFF656567),
//     ),
//   );