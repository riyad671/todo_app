import 'package:flutter/material.dart';
import 'package:todo_app/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(125, 186, 255, 1),
      ),
    ),
  );
}
