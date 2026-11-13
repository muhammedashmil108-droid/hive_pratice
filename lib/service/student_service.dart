import 'package:hive/hive.dart';
import 'package:hive_pratice/model/student_model.dart';

class StudentService {
  final Box<Student> studentBox = Hive.box<Student>('studentBox');

  // Add Student
  Future<void> addStudent(Student student) async {
    await studentBox.add(student);
  }

  // Delete Student
  Future<void> deleteStudent(int index) async {
    await studentBox.deleteAt(index);
  }

  // Get Students
  List<Student> getStudents() {
    return studentBox.values.toList();
  }
}