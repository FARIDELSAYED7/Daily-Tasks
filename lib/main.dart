
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/TaskProvider.dart';
import 'package:todo/screens/mainscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:MyHomePage(),
      ),
    );
  }
}

