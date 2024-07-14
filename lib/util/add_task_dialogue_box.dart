import 'package:flutter/material.dart';
import 'package:todo_app/util/dialogue_box_button.dart';

class DialogueBox extends StatelessWidget {
  final controller;
  VoidCallback onSave, onCancel;
  DialogueBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow.shade200,
      content: Container(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              autocorrect: true,
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                hintText: "Enter the task...",
                
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(text: "Add", onPressed: onSave),
                const SizedBox(width: 20),
                Button(text: "Cancel", onPressed: onCancel,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}