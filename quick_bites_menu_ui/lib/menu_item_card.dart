import 'package:flutter/material.dart';
import 'package:quick_bites_menu_ui/menu_model.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;
  final int quantity;
  final VoidCallback onAdd;

  const MenuItemCard({
    super.key,
    required this.menuItem,
    required this.quantity,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
              color: Colors.black38,
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2)
          ),],
          color: Color.fromARGB(200, 255, 253, 235),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(222, 221, 221, 221),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(menuItem.icon,
                size: 80,),
            ),
            SizedBox(width: 30,),
            Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(menuItem.name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text("Rs. ${menuItem.price}"
                        ,style: TextStyle(
                            fontSize: 14
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //     decoration: BoxDecoration(
                  //       color: Color.fromARGB(255, 10, 124, 110),
                  //       borderRadius: BorderRadius.circular(15)
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(4.0),
                  //       child: Icon(Icons.add,color: Colors.white,),
                  //     ),
                  // ),
                  Row(
                    children: [
                      if(quantity>0)
                        SizedBox(
                            width: 20,
                            child: Text("$quantity")),
                      IconButton(onPressed: (){
                        onAdd();
                      },
                          icon: Icon(Icons.add),
                          style: IconButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 10, 124, 110),
                              foregroundColor: Colors.white,
                              iconSize: 20
                          )),
                    ],
                  )
                ]
            ))
          ],
        ),
      ),
    );
  }
}