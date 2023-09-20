import 'package:flutter/material.dart';
import 'package:intro_app/pages/home_page.dart';
import 'package:intro_app/pages/homework.dart';
import 'package:intro_app/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: homework(),
      routes: {
        Home_page.id: (context) => Home_page(),
        Intro_page.id: (context) => Intro_page(),
        homework.id: (context) => homework(),
      },
    );
  }
}
