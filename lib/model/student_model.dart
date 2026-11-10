class StudentModel {
  String name;
  int age;

  StudentModel({required this.name, required this.age});

  Map<String, dynamic> toMap() {
    return {"name": name, "age": age};
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(name: map["name"], age: map["age"]);
  }
}
