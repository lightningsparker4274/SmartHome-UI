import 'package:flutter/material.dart';
import 'package:smartui/components/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Rajdhani'),
        debugShowCheckedModeBanner: false,
        home: const Homepage());
  }
}
