import '../lib/models/student.dart';
import '../lib/models/course.dart';
import '../lib/models/university.dart';

void main() {
  print('=== University Management System Demo ===');
  runUniversityDemo();
}

void runUniversityDemo() {
  // 1. Створюємо університет
  University uni = University(name: "Tech University");

  // 2. Додаємо студентів
  var s1 = Student(
      id: "S1",
      firstName: "Nikita",
      lastName: "Bondarenko",
      birthDate: DateTime(2006, 8, 4));
  var s2 = Student(
      id: "S2",
      firstName: "Ivan",
      lastName: "Petrov",
      birthDate: DateTime(2003, 3, 22));

  uni.addStudent(s1);
  uni.addStudent(s2);

  // 3. Додаємо професора
  var prof = Professor(
      id: "P1",
      firstName: "Olga",
      lastName: "Ivanova",
      birthDate: DateTime(1975, 8, 10),
      department: "Computer Science",
      salary: 1500);
  uni.professors.add(prof);

  // 4. Створюємо курси
  var course = Course(
      id: "C1",
      name: "Programming",
      description: "Intro to Dart",
      credits: 5,
      instructor: prof.fullName);
  uni.courses.add(course);

  // 5. Записуємо студента на курс
  s1.enrollInCourse("C1");
  s1.addGrade("C1", 95);

  s2.enrollInCourse("C1");
  s2.addGrade("C1", 70);

  // 6. Виводимо статистику
  print("\n--- University Statistics ---");
  print(uni.generateStatistics());
}
