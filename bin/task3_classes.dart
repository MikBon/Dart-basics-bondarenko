import '../lib/models/student.dart';
import '../lib/models/course.dart';
import '../lib/models/university.dart';

void runUniversityDemo() {
  final uni = University(name: 'Dart University');

  final s1 = Student(id: 's1', firstName: 'Anna', lastName: 'Ivanova', birthDate: DateTime(2000, 5, 12));
  final s2 = Student(id: 's2', firstName: 'Ivan', lastName: 'Petrov', birthDate: DateTime(1999, 3, 3));

  uni.addStudent(s1);
  uni.addStudent(s2);

  final c1 = Course(id: 'c1', name: 'Algorithms', description: 'Algo', credits: 4, instructor: 'Dr. A');
  final c2 = Course(id: 'c2', name: 'Databases', description: 'DB', credits: 3, instructor: 'Dr. B');

  uni.courses.addAll([c1, c2]);

  s1.enrollInCourse('c1');
  s2.enrollInCourse('c1');
  s2.enrollInCourse('c2');

  s1.addGrade('c1', 95);
  s2.addGrade('c1', 75);
  s2.addGrade('c2', 85);

  print('Students:');
  for (var s in uni.students) print(s);

  print('\nStatistics: \${uni.generateStatistics()}');
}

void main() {
  print('=== University Management System Demo ===');
  runUniversityDemo();
}
