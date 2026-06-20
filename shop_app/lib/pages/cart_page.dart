import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {



  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    // final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context,index)
        {
          final cartItem = cart[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                cartItem['imageUrl'] as String
              ),
              radius: 45,
            ),
            title: Text(cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
             ),
            subtitle: Text(cartItem['size'].toString()),
            trailing: IconButton(onPressed: (){
                showDialog(context: context,
                    builder: (context)
                    {
                      return Dialog(
                        child: Container(
                          height: 200,
                          width: 300,

                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Are You Sure?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22
                                ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green
                                        ),
                                        child: Text("No",
                                        style: TextStyle(
                                          color: Colors.white
                                        ),)),
                                    ElevatedButton(onPressed: (){
                                      // Provider.of<CartProvider>(context,
                                      //     listen: false).removeProduct(cartItem,context);
                                      context.read<CartProvider>().removeProduct(cartItem, context);
                                      Navigator.of(context).pop();
                                      },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        child: Text("Yes",
                                        style: TextStyle(
                                          color: Colors.white
                                        ),)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                );
            },
                icon: Icon(Icons.delete
                ,color: Colors.red,)),
          );
        },
      ),
    );
  }
}
