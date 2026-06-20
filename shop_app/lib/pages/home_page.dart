import 'package:flutter/material.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/widgets/product_list.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentNavIndex=0;

  List<Widget> pages  = const [
    ProductList(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: IndexedStack(
        index: _currentNavIndex,
        children: pages,

      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        currentIndex: _currentNavIndex,
        onTap: (int index){
          setState(() {
            _currentNavIndex = index;
          });
        },
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag,),
            label: "Shopping_Cart"
          ),
        ],
      ),

    );
  }
}
