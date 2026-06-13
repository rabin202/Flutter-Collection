import 'package:flutter/material.dart';
import 'package:quick_bites_menu_ui/menu_model.dart';
import 'package:quick_bites_menu_ui/menu_item_card.dart';


class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});


  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int totalCartCount=99;
  int bottomNavTracker=0;
  List<MenuItem> menuItems =[
    MenuItem(name: "Chicken Momo(6pcs)", price: 250, icon: Icons.ramen_dining),
    MenuItem(name: "Pepperoni Slice", price: 180, icon:Icons.local_pizza),
    MenuItem(name: "Hot Americano", price: 150, icon:Icons.coffee ),
  ];
  Map<String,int> itemQuantityTracker={};


  @override
  void initState()
  {
    super.initState();
    totalCartCount=0;
    bottomNavTracker=0;
    menuItems.forEach((menuItem) {
      itemQuantityTracker[menuItem.name] = 0;
    });  }

  void addToCart(MenuItem item,int newQuantity)
  {
    int previousQuantity = itemQuantityTracker[item.name]!;
    setState(() {
      itemQuantityTracker[item.name]=newQuantity;
      if (previousQuantity>newQuantity)
      {
        totalCartCount-=(previousQuantity-newQuantity);
      }
      else
      {
        totalCartCount +=(newQuantity-previousQuantity);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
        centerTitle: true,
        title: const Text('Quick Bites',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),),
        actionsPadding: EdgeInsetsGeometry.fromLTRB(0, 0, 10, 0),
        actions:<Widget> [
          if(totalCartCount>0)
            Stack(
              children:<Widget> [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(Icons.shopping_bag_outlined,
                    size: 30,),
                ),
                Positioned(
                  top: 5.5,
                  right: 6.5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 10, 124, 110),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Center(
                        child: Text("$totalCartCount",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white
                          ),),
                      ),
                    ),
                  ),
                )
              ],
            )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromARGB(110, 180, 180, 184)
        ),
        child: ListView.builder(
          itemCount: menuItems.length,
          itemBuilder: (context, index) {

            final item = menuItems[index];

            return MenuItemCard(
              menuItem: item,
              quantity: itemQuantityTracker[item.name]!,
              onAdd: () {
                setState(() {
                  addToCart(
                    item,
                    itemQuantityTracker[item.name]! + 1,
                  );
                });

              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavTracker,
        iconSize: 30,
        selectedItemColor: Color.fromARGB(255, 33, 124, 110),
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,

        onTap: (index) {
          setState(() {
            bottomNavTracker = index;
          });
        },

        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),

          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,

              children: [
                SizedBox(height: 10,),
                const Icon(Icons.shopping_cart_outlined),

                if (totalCartCount > 0)
                  Positioned(
                    right: -5,
                    top: -5,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 10, 124, 110),
                        // borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Text("$totalCartCount",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),),
                        ),
                      ),
                    ),
                  )],
            ),
            label: 'Cart',
          ),

          BottomNavigationBarItem(
            icon:Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}