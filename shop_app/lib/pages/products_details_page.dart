import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/global_variables.dart';


class ProductsDetailsPage extends StatefulWidget {
  final Map<String,dynamic> product;

  const ProductsDetailsPage({super.key,
  required this.product});

  @override
  State<ProductsDetailsPage> createState() => _ProductsDetailsPageState();
}

class _ProductsDetailsPageState extends State<ProductsDetailsPage> {

  int selectedSize=0;

  void onTap(){

    Provider.of<CartProvider>(context,
        listen: false).addProduct(widget.product,selectedSize,context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.product['title'] as String,
          style: Theme.of(context).textTheme.titleLarge,),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String,
            height: 250,),
          ),
          const Spacer(flex: 2,),
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color.fromRGBO(245, 247, 249, 1),
            ),
            child: Column(
              children: [
                Text("\$${widget.product['price']}",
                style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context,index){
                        final size = (widget.product['sizes'] as List<int>)[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap:(){
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(label: Text(size.toString()),
                            backgroundColor: (size==selectedSize)?Theme.of(context).colorScheme.primary : null),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(onPressed:onTap,
                    icon: Icon(Icons.shopping_cart_outlined,color: Colors.black,size: 22,),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize: const Size(350, 50)
                    ), label: const Text("Add To Cart",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
