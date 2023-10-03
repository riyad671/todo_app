import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({
    super.key,
    required this.taskCompleted,
    required this.taskName,
    required this.onChanged,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(246, 252, 253, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            // Checkbox
            Checkbox(value: taskCompleted, onChanged: onChanged),

            //Task
            const Text('Task'),
          ],
        ),
      ),
    );
  }
}
