import 'package:flutter/material.dart';
import 'package:todo_app/utility/todo_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(191, 232, 255, 1),
      appBar: AppBar(
        title: const Text('To Do'),
        elevation: 0.9,
      ),
      body: ListView(
        children: const [
          ToDoTile(),
        ],
      ),
    );
  }
}
