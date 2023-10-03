import 'package:flutter/material.dart';
import 'package:todo_app/utility/my_button.dart';

class DialogBox extends StatelessWidget {
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(195, 211, 219, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Get User input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Add Task',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  // Change the border radius
                ),
                hintText: 'Add new task',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Cancel button
                MyButton(onPressed: onCancel, text: 'Cancel'),

                const SizedBox(
                  width: 10,
                ),

                //  save button
                MyButton(onPressed: onSave, text: 'Save'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
