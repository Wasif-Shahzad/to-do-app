import 'package:flutter/material.dart';
import 'package:todo_app/pages/friday_tasks.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/saturday_tasks.dart';
import 'package:todo_app/pages/sunday_tasks.dart';
import 'package:todo_app/pages/thursday_tasks.dart';
import 'package:todo_app/pages/tuesday_tasks.dart';
import 'package:todo_app/pages/wednesday_tasks.dart';

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
      home: const HomePage(),
      routes: {
        '/monday': (context) => const HomePage(),
        '/tuesday': (context) => const TuesdayTasks(),
        '/wednesday': (context) => const WednesdayTasks(),
        '/thursday': (context) => const ThursdayTasks(),
        '/friday': (context) => const FridayTasks(),
        '/saturday': (context) => const SaturdayTasks(),
        '/sunday': (context) => const SundayTasks(),
      },
    );
  }
}