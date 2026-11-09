import 'package:flutter/material.dart';

import 'home.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('studentBox');

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
