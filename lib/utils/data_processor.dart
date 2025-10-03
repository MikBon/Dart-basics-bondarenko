import '../models/student.dart';
import '../models/university.dart';

class DataProcessor {
  static List<int> filterEvenNumbers(List<int> numbers) => numbers.where((n) => n.isEven).toList();

  static Map<String, int> countWords(String text) {
    final words = text
        .toLowerCase()
        .replaceAll(RegExp(r"[^a-zA-Z0-9а-яА-ЯіІїЇєЄ'\s]"), '')
        .split(RegExp(r"\s+"))
        .where((w) => w.isNotEmpty);
    final Map<String, int> counts = {};
    for (var w in words) {
      counts[w] = (counts[w] ?? 0) + 1;
    }
    return counts;
  }

  static List<Map<String, dynamic>> sortStudentsByGPA(List<Student> students) {
    final copy = List<Student>.from(students);
    copy.sort((a, b) => b.gpa.compareTo(a.gpa));
    return copy.map((s) => {'id': s.id, 'name': s.fullName, 'gpa': s.gpa}).toList();
  }

  static Set<String> findCommonCourses(List<Student> students) {
    if (students.isEmpty) return {};
    Set<String> common = students.first.enrolledCourses.toSet();
    for (var s in students.skip(1)) {
      common = common.intersection(s.enrolledCourses.toSet());
    }
    return common;
  }

  static Map<String, List<Student>> groupStudentsByYear(List<Student> students) {
    final Map<String, List<Student>> map = {};
    for (var s in students) {
      final year = s.birthDate.year.toString();
      map.putIfAbsent(year, () => []).add(s);
    }
    return map;
  }

  static Map<String, double> calculateAverageGradesByCourse(List<Student> students) {
    final Map<String, List<double>> tmp = {};
    for (var s in students) {
      s.grades.forEach((course, grade) {
        tmp.putIfAbsent(course, () => []).add(grade);
      });
    }
    return tmp.map((k, v) => MapEntry(k, v.reduce((a, b) => a + b) / v.length));
  }

  static List<Map<String, dynamic>> generateReport(University university) {
    return university.students.map((s) => s.toJson()).toList();
  }
}
