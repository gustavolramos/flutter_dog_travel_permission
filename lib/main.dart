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
      debugShowCheckedModeBanner: false,
      home:  const HomePage(),
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 30, color: Colors.black),
          bodySmall: TextStyle(fontSize: 20, color: Colors.black),
        )
      ),
    );
  }
}