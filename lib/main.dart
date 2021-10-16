import 'package:flutter/material.dart';
import 'package:hometask2/home.dart';
import 'package:hometask2/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Task 2",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
       home: const Home(),
    );
  }
}

