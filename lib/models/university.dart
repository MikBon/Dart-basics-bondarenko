import 'student.dart';
import 'course.dart';

// Абстрактна особа
abstract class Person {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;

  Person({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
  });

  String get fullName => "$firstName $lastName";
  int get age {
    final today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  String get role;
}

// Професор
class Professor extends Person {
  final String department;
  final List<String> taughtCourses;
  final double salary;

  Professor({
    required String id,
    required String firstName,
    required String lastName,
    required DateTime birthDate,
    required this.department,
    required this.salary,
    List<String>? taughtCourses,
  })  : taughtCourses = taughtCourses ?? [],
        super(
            id: id,
            firstName: firstName,
            lastName: lastName,
            birthDate: birthDate);

  @override
  String get role => 'Professor';
}

// Університет
class University {
  final String name;
  final List<Student> students;
  final List<Professor> professors;
  final List<Course> courses;

  University({
    required this.name,
    List<Student>? students,
    List<Professor>? professors,
    List<Course>? courses,
  })  : students = students ?? [],
        professors = professors ?? [],
        courses = courses ?? [];

  // CRUD студенти
  void addStudent(Student student) {
    students.add(student);
  }

  void removeStudent(String studentId) {
    students.removeWhere((s) => s.id == studentId);
  }

  Student? findStudentById(String id) {
    try {
      return students.firstWhere((s) => s.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Student> getStudentsByCourse(String courseId) {
    return students.where((s) => s.enrolledCourses.contains(courseId)).toList();
  }

  // CRUD курси
  List<Course> getAvailableCoursesForStudent(String studentId) {
    Student? student = findStudentById(studentId);
    if (student == null) return [];
    return courses.where((c) => c.canStudentEnroll(student)).toList();
  }

  // Статистика
  Map<String, dynamic> generateStatistics() {
    int totalStudents = students.length;
    double averageGPA = 0;
    if (students.isNotEmpty) {
      averageGPA =
          students.map((s) => s.gpa).reduce((a, b) => a + b) / totalStudents;
    }
    return {
      "totalStudents": totalStudents,
      "averageGPA": averageGPA,
      "students": students.map((s) => s.fullName).toList(),
    };
  }
}
