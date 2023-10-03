import 'package:flutter/material.dart';
import 'package:todo_app/utility/todo_tile.dart';
import 'package:todo_app/utility/dialog_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Text controller
  final _controller = TextEditingController();
  // List of To-Do task
  List toDoList = [
    ['Finish To-Do App', false],
    ['Compile quiz app', true],
  ];
  // Checkbox was taped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // Save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([
        _controller.text,
        false,
      ]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // Create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(191, 232, 255, 1),

      // App bar
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

      // Floating button for add some task
      floatingActionButton: Transform.scale(
        scale: 0.8,
        child: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: const Color.fromRGBO(255, 255, 255, 0.815),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),

      //Build function
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
