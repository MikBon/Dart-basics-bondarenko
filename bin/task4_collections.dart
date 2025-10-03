void main() {
  print('=== Dart Collections & Data Processing Demo ===');
  demonstrateLists();
  demonstrateSets();
  demonstrateMaps();
  demonstrateAdvancedOperations();
}

void demonstrateLists() {
  print('\n--- Lists Demo ---');
  List<int> nums = [1, 2, 3, 4, 5];
  print('Original: $nums');
  print('Filtered even: ${nums.where((n) => n.isEven)}');
  print('Squares: ${nums.map((n) => n * n)}');
  print('Sum: ${nums.reduce((a, b) => a + b)}');
}

void demonstrateSets() {
  print('\n--- Sets Demo ---');
  Set<String> a = {"apple", "banana", "cherry"};
  Set<String> b = {"banana", "cherry", "date"};

  print('Union: ${a.union(b)}');
  print('Intersection: ${a.intersection(b)}');
}

void demonstrateMaps() {
  print('\n--- Maps Demo ---');
  Map<String, int> scores = {"Alice": 90, "Bob": 80};
  scores["Charlie"] = 70;

  scores.forEach((k, v) => print("$k => $v"));
}

void demonstrateAdvancedOperations() {
  print('\n--- Advanced Collections ---');
  List<Map<String, dynamic>> students = [
    {"name": "Alice", "gpa": 3.5},
    {"name": "Bob", "gpa": 4.0},
    {"name": "Charlie", "gpa": 2.8},
  ];

  students.sort((a, b) => b["gpa"].compareTo(a["gpa"]));
  print('Sorted by GPA: $students');
}
