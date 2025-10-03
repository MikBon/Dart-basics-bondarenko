import '../lib/utils/data_processor.dart';
import '../lib/models/student.dart';

void demonstrateLists() {
  var list = [5, 2, 9, 1];
  print('sorted: \${(List.of(list)..sort())}');
  print('filtered even: \${DataProcessor.filterEvenNumbers(list)}');
}

void demonstrateSets() {
  var s1 = {1, 2, 3};
  var s2 = {2, 3, 4};
  print('union: \${s1.union(s2)}, intersection: \${s1.intersection(s2)}');
}

void demonstrateMaps() {
  var students = [
    Student(id: 's1', firstName: 'A', lastName: 'A', birthDate: DateTime(2000,1,1)),
    Student(id: 's2', firstName: 'B', lastName: 'B', birthDate: DateTime(2001,1,1)),
  ];
  print('groupByYear: \${DataProcessor.groupStudentsByYear(students)}');
}

void demonstrateAdvancedOperations() {
  // placeholder for complex transformations
  print('Advanced operations demo');
}

void main() {
  print('=== Dart Collections & Data Processing Demo ===');
  demonstrateLists();
  demonstrateSets();
  demonstrateMaps();
  demonstrateAdvancedOperations();
}
