import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{

  final List<Map<String,dynamic>> cart = [];

  void addProduct(Map<String,dynamic> product,int selectedSize, BuildContext context)
  {
    if(selectedSize !=0)
      {
        cart.add({
          'id': product['id'],
          'title': product['title'],
          'price': product['price'],
          'imageUrl': product['imageUrl'],
          'company': product['company'],
          'size': selectedSize,
        });
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:const Text("Item added Successfully!!"),),);
      }
    else
      {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:const Text("Please Select Size"),),);
      }

  }

  void removeProduct(Map<String,dynamic> product,context)
  {
    cart.remove(product);
    notifyListeners();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:const Text("Item removed from cart Successfully!!"),),);
  }


}