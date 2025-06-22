import 'package:flutter/material.dart';
import 'screens/logic_added.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LogicAdded(), debugShowCheckedModeBanner: false);
  }
}
