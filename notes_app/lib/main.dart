import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:notes_app/models/note.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('notes');
  runApp(const MyApp(

  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>NoteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Nunito',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
            primary: Color.fromRGBO(37, 37, 37, 1),
            secondary: Colors.grey,
            brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: const TextStyle(
            fontSize: 43,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 1.3
          ),
          bodyMedium: const TextStyle(
            fontSize: 35,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w400,
          ),
        ),
        ),
        home: const HomePage(),

      ),
    );
  }
}



