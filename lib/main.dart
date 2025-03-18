import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(256, 206, 1, 1),
          primary: const Color.fromARGB(255, 249, 199, 18),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(fontWeight: FontWeight.bold),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black),
        ),
        useMaterial3: true,
      ),
      title: "Shopping App",
      home: HomePage(),
    );
  }
}
