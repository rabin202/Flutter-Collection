import 'package:flutter/material.dart';




class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color bgColor;

  const ProductCard({super.key,
  required this.title,
  required this.price,
  required this.image,
  required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
      margin: EdgeInsets.all(20),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 20,),
          Text("\$$price",style: Theme.of(context).textTheme.bodySmall,),
          const SizedBox(height: 20,),
          Center(child: Image.asset(image,height:175,fit: BoxFit.contain))
        ],
      ),
    );
  }
}
