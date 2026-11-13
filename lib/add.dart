import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:hive_pratice/home.dart';
import 'package:hive_pratice/model/student_model.dart';
import 'package:hive_pratice/service/student_service.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {

  final StudentService studentService = StudentService();

  final Box<Student> studentBox = Hive.box<Student>('studentBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student Lists",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 30),

          Expanded(
            child: ValueListenableBuilder(
              valueListenable: studentBox.listenable(),

              builder: (context, box, child) {

                final students = studentService.getStudents();

                return ListView.builder(
                  itemCount: students.length,

                  itemBuilder: (context, index) {

                    final student = students[index];

                    return Card(
                      margin: EdgeInsets.all(10),
                      elevation: 5,

                      child: ListTile(
                        leading: Icon(Icons.person),

                        title: Text(student.name),

                        subtitle: Text(student.age.toString()),

                        trailing: IconButton(
                          onPressed: () async {

                            await studentService.deleteStudent(index);

                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}