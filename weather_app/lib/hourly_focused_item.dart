import 'package:flutter/material.dart';


class HourlyFocusedItem extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;

  const HourlyFocusedItem({super.key,required this.time,required this.icon,required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: EdgeInsetsGeometry.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(time,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,),
            const SizedBox(
              height: 8,
            ),
            Icon(icon,
              size: 32,),
            const SizedBox(
              height: 8,
            ),
            Text("$temperature K",)
          ],
        ),
      ),
    );
  }
}
