import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(246, 252, 253, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Text('Data'),
      ),
    );
  }
}
