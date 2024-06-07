
import 'package:flutter/material.dart';
import 'package:todo/Models/TaskModel.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(String title) {
    tasks.add(Task(title));
    notifyListeners();
  }

  void toggleTask(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    notifyListeners();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
