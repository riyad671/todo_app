import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/screen/home_screen.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Open a box
  var box = await Hive.openBox('mybox');

  // Run main app from here
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(154, 201, 255, 1),
      ),
    ),
  );
}
