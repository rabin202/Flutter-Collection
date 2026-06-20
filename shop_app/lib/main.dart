import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/pages/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
              seedColor:Color.fromRGBO(254, 206, 1, 1),
              primary: Color.fromRGBO(254, 206, 1, 1),
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: TextTheme
            (
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
              titleMedium: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16

            )
            ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black
            ),
          ),
        useMaterial3: true
        ),

        title: "Shop App",
        home:const HomePage(),
      ),
    );
  }
}
