import 'package:flutter/material.dart';
import 'package:todo/Models/TaskModel.dart';
import 'package:todo/provider/TaskProvider.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final TaskProvider taskProvider; // Added taskProvider argument
  final Function(bool?)? onToggle;
  final Function() onDelete;

  const TaskItem(
      {Key? key,
      required this.task,
      required this.taskProvider,
      required this.onToggle,
      required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        task.title,
        style: TextStyle(color: Colors.white),
      ),
      value: task.isDone,
      onChanged: onToggle, // No need for explicit type casting here
      secondary: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
