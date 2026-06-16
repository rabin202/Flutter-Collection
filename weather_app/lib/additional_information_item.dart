import 'dart:ffi';

import 'package:flutter/material.dart';

class AdditionalInformationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final double value;
  const AdditionalInformationItem({super.key,required this.title, required this.value, required this.icon});


  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Icon(icon,
              size: 40,),

            const SizedBox(
              height: 16,
            ),
            Text("$title",
              style: TextStyle(
                color: Color.fromARGB(180, 255, 255, 255),
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),),
            const SizedBox(
              height: 8,
            ),
            Text("$value",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(230, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),)
          ],
    );
  }
}
