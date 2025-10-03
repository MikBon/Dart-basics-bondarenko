import 'dart:io';
import 'dart:convert';
import '../lib/models/student.dart';

Future<String> fetchStudentData(String studentId) async {
  await Future.delayed(Duration(milliseconds: 300));
  return jsonEncode({'id': studentId, 'firstName': 'Test', 'lastName': 'User', 'birthDate': DateTime(2000,1,1).toIso8601String()});
}

Future<List<Student>> loadStudentsFromFile(String filename) async {
  final file = File(filename);
  if (!await file.exists()) return [];
  final contents = await file.readAsString();
  final List<dynamic> arr = jsonDecode(contents);
  return arr.map((e) => Student.fromJson(e as Map<String, dynamic>)).toList();
}

Future<void> saveStudentsToFile(List<Student> students, String filename) async {
  final file = File(filename);
  final s = jsonEncode(students.map((s) => s.toJson()).toList());
  await file.writeAsString(s);
}

Stream<Student> studentStream() async* {
  for (var i = 0; i < 3; i++) {
    await Future.delayed(Duration(milliseconds: 200));
    yield Student(id: 's\$i', firstName: 'Generated', lastName: '\$i', birthDate: DateTime(2000,1,1));
  }
}

Future<void> demonstrateFutures() async {
  final results = await Future.wait([fetchStudentData('s1'), fetchStudentData('s2')]);
  print('fetched: \$results');
}

Future<void> demonstrateStreams() async {
  await for (var s in studentStream()) {
    print('streamed student: \${s.id}');
  }
}

Future<void> demonstrateFileOperations() async {
  final tmp = [Student(id: 'file1', firstName: 'F', lastName: 'L', birthDate: DateTime(2000))];
  await saveStudentsToFile(tmp, 'students_sample.json');
  final loaded = await loadStudentsFromFile('students_sample.json');
  print('loaded from file: \${loaded.length}');
}

Future<void> main() async {
  print('=== Dart Async Programming Demo ===');
  await demonstrateFutures();
  await demonstrateStreams();
  await demonstrateFileOperations();
}
