import 'package:flutter/material.dart';
import 'common/19_september/task_19_september.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Directory',
      home: const September19App(),
    );
  }
}