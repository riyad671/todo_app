import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/utility/todo_tile.dart';
import 'package:todo_app/utility/dialog_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

  // Text controller
  final _controller = TextEditingController();
  // List of To-Do task
  // List toDoList = [
  //   ['Finish To-Do App', false],
  //   ['Compile quiz app', false],
  // ];
  // Checkbox was taped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // Save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([
        _controller.text,
        false,
      ]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // Delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
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
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            // deleteFunction: (context) => deleteTask,
            deleteFunction: (p0) {
              deleteTask(index);
            },
          );
        },
      ),
    );
  }
}
