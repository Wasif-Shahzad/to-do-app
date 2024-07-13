import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskname;
  final bool taskStatus;
  Function(bool?)? onChanged;
  ToDoTile({
    super.key,
    required this.taskname,
    required this.taskStatus,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      child: Container(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            Checkbox(value: taskStatus, onChanged: onChanged),
            const SizedBox(width: 10),
            Text(
              taskname,
              style: TextStyle(
                decoration: taskStatus ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}