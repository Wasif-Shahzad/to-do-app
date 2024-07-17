import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
        )
      ),
      home: const HomePage("monday", 0),
      routes: {
        '/monday': (context) => const HomePage("monday", 0),
        '/tuesday': (context) => const HomePage("tuesday", 1),
        '/wednesday': (context) => const HomePage("wednesday", 2),
        '/thursday': (context) => const HomePage("thursday", 3),
        '/friday': (context) => const HomePage("friday", 4),
        '/saturday': (context) => const HomePage("saturday", 5),
        '/sunday': (context) => const HomePage("sunday", 6),
      },
    );
  }
}