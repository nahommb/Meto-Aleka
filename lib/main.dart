import 'package:flutter/material.dart';
import 'package:meto_aleka/data/data_provider.dart';
import 'package:meto_aleka/presentation/screens/detail.dart';
import 'package:meto_aleka/presentation/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>dataProvider())

  ],
  child:MyApp() ,) );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        homeScreen.route_name:(context)=>homeScreen(),
        detailScreen.route_name:(context)=>detailScreen(),
      },
      home: homeScreen(),
    );
  }
}
