import 'package:flutter/material.dart';

import 'add.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'model/student_model.dart';
import 'service/student_service.dart';

final StudentService studentService = StudentService();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final box = Hive.box('studentBox');

  final usernameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student App",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                    hintText: "Enter your age",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    StudentModel student = StudentModel(
                      name: usernameController.text.trim(),
                      age: int.tryParse(ageController.text.trim()) ?? 0,
                    );

                    await studentService.addStudent(student);

                    if (mounted) {
                      usernameController.clear();
                      ageController.clear();

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Add()),
                      );
                    }
                  },

                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
