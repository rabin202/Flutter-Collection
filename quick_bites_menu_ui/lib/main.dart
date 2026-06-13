import 'package:flutter/material.dart';
import 'package:quick_bites_menu_ui/menu_screen.dart';

void main() {
  runApp(QuickBitesApp());
}


class QuickBitesApp extends StatelessWidget {
  const QuickBitesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MenuScreen(),
    );
  }
}






