import 'package:flutter/material.dart';
import 'package:meto_aleka/presentation/screens/home.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      routes: {
        homeScreen.route_name:(context)=>homeScreen(),
      },
      home: homeScreen(),
    );
  }
}
