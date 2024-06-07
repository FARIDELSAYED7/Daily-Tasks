import 'package:flutter/material.dart';
import 'package:todo/screens/mainscreen.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SizedBox(
            height: 75,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 28,
                    color: Colors.white,
                  )),
              Spacer(
                flex: 1,
              ),
              Text(
                "Add Task",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Spacer(
                flex: 1,
              )
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 10),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
                helperStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                helperText: 'Add You Daily Task',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              style: TextStyle(color: Colors.white,fontSize: 18),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, _textController.text);
            },
            child: Text(
              'Add',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    ));
  }
}
