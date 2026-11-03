import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(Student());
}

class Student extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Student App",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
