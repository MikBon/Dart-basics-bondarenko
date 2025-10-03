import 'student.dart';
import 'course.dart';


abstract class Person {
final String id;
final String firstName;
final String lastName;
final DateTime birthDate;


Person({required this.id, required this.firstName, required this.lastName, required this.birthDate});


String get fullName => '\$firstName \$lastName';
int get age {
final now = DateTime.now();
int age = now.year - birthDate.year;
if (now.month < birthDate.month ||
(now.month == birthDate.month && now.day < birthDate.day)) {
age -= 1;
}
return age;
}


String get role;
}


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
}) : taughtCourses = taughtCourses ?? [],
super(id: id, firstName: firstName, lastName: lastName, birthDate: birthDate);


@override
String get role => 'Professor';


void assignCourse(String courseId) {
if (!taughtCourses.contains(courseId)) taughtCourses.add(courseId);
}
}


class University {
final String name;
final List<Student> students;
final List<Professor> professors;
final List<Course> courses;


University({required this.name, List<Student>? students, List<Professor>? professors, List<Course>? courses})
: students = students ?? [],
professors = professors ?? [],
courses = courses ?? [];


void addStudent(Student student) => students.add(student);
void removeStudent(String studentId) => students.removeWhere((s) => s.id == studentId);
Student? findStudentById(String id) => students.firstWhere((s) => s.id == id, orElse: () => null);


List<Student> getStudentsByCourse(String courseId) => students.where((s) => s.enrolledCourses.contains(courseId)).toList();


List<Course> getAvailableCoursesForStudent(String studentId) {
final s = findStudentById(studentId);
if (s == null) return [];
return courses.where((c) => c.canStudentEnroll(s)).toList();
}


Map<String, dynamic> generateStatistics() {
final avgGpa = students.isEmpty ? 0.0 : students.map((s) => s.gpa).reduce((a, b) => a + b) / students.length;
return {
'studentsCount': students.length,
'professorsCount': professors.length,
'coursesCount': courses.length,
'averageGPA': avgGpa,
};
}
}