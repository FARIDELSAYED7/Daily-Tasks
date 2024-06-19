// In your main app file (e.g., main.dart)

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/TaskModel.dart';
import 'package:todo/provider/TaskProvider.dart'; // Import TaskProvider
import 'package:todo/screens/Add_Task_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final taskProvider =
        Provider.of<TaskProvider>(context); // Access using Provider
    void navigateToAddTask() async {
      final newTaskTitle = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddTaskScreen()),
      );
      if (newTaskTitle != null) {
        taskProvider.addTask(newTaskTitle); // Now accessible
      }
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 1, 66, 104),
            Color.fromARGB(255, 57, 117, 196),
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 85,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                width: 45,
              ),
              Text(
                'Daily Tasks',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: navigateToAddTask,
                  icon: Icon(
                    Icons.add_circle_outlined,
                    size: 28,
                    color: Colors.white,
                  ))
            ]),
            Expanded(
              child: ListView.builder(
                itemCount: taskProvider.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskProvider.tasks[index];
                  return CheckboxListTile(
                    checkColor: Colors.white,
                    title: Text(
                      task.title,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    value: task.isDone,
                    onChanged: (newValue) => taskProvider.toggleTask(index),
                    secondary: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onPressed: () => taskProvider.removeTask(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
