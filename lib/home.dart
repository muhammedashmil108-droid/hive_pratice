import 'package:flutter/material.dart';
import 'package:hive_pratice/model/student_model.dart';
import 'package:hive_pratice/service/student_service.dart';
import 'add.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
final StudentService studentService = StudentService();

final usernameController = TextEditingController();
final ageController = TextEditingController();

void add()async{
  String name = usernameController.text.trim();
  int? age = int.tryParse(ageController.text.trim());

if(name.isEmpty || age == null){
  return;
}

Student student =Student(name: name, age: age);
await studentService.addStudent(student);
usernameController.clear();
ageController.clear();


}
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
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
                SizedBox(height: 12),
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


  add();

 
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Add()),
    );

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
