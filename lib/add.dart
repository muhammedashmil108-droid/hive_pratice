import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_pratice/home.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final Box studentBox = Hive.box('studentBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student Lists",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
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
                final students = box.values.toList();

                return ListView.builder(
                  itemCount: students.length,

                  itemBuilder: (context, index) {
                    final student = students[index];

                    return Card(
                      margin: EdgeInsets.all(10),
                      elevation: 5,

                      child: ListTile(
                        leading: Icon(Icons.person),

                        title: Text("${student["name"]}"),

                        subtitle: Text("${student["age"]}"),

                        trailing: IconButton(
                          onPressed: () async {
                            // Delete student from Hive Box
                            await studentBox.deleteAt(index);
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
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
