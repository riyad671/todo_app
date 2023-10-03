import 'package:flutter/material.dart';
import 'package:todo_app/utility/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of To-Do task
  List toDoList = [
    [
      "Finish To-Do App",
      false,
    ],
    [
      "Compile quiz app",
      false,
    ],
  ];
  // Checkbox was taped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(191, 232, 255, 1),
      appBar: AppBar(
        title: const Text('To Do'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
        // Icon
        leading: IconButton(
          icon: const Icon(Icons.menu), // Add your icon here
          onPressed: () {
            // Add your action when the icon is pressed
          },
        ),
        elevation: 0.9,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
