import 'package:hive_flutter/hive_flutter.dart';

import '../model/student_model.dart';

class StudentService {
  final Box studentBox = Hive.box('studentBox');

  // Add Student
  Future<void> addStudent(StudentModel student) async {
    await studentBox.add(student.toMap());
  }

  // Get Students
  List<StudentModel> getStudents() {
    return studentBox.values.map((student) {
      return StudentModel.fromMap(Map<String, dynamic>.from(student));
    }).toList();
  }

//   // Delete Student
//   Future<void> deleteStudent(int index) async {
//     await studentBox.deleteAt(index);
//   }
// }
