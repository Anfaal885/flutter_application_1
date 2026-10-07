import 'package:flutter/material.dart';
import 'users_screen.dart';

class September19App extends StatelessWidget {
  const September19App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users API App',
      home: const UsersScreen(),
    );
  }
}