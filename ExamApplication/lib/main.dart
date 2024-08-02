import 'package:examapp/Views/Auth/login.dart';
import 'package:examapp/Views/Auth/mainScreen.dart';
import 'package:examapp/Views/class/leader/class_leader.dart';
import 'package:examapp/Views/joinAndcreate/createClass.dart';
import 'package:flutter/material.dart';

import 'Views/joinAndcreate/joinClass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Class());
  }
}
