// bin/task1_variables.dart
void main() {
  print('=== Dart Variables & Types Demo ===');
  demonstrateNumbers();
  demonstrateStrings();
  demonstrateBooleans();
  demonstrateCollections();
  demonstrateNullSafety();
}

// Демонстрація чисел
void demonstrateNumbers() {
  print('\n--- Numbers Demo ---');
  int age = 20;
  double height = 1.82;
  num anyNumber = 42; // може бути int або double

  print('Age: $age');
  print('Height: $height');
  print('Any number: $anyNumber');

  // Математичні операції
  print('Sum: ${age + 5}');
  print('Division: ${age / 3}');
  print('Modulo: ${age % 7}');

  // Конвертації
  String numStr = age.toString();
  int parsed = int.parse('123');
  double parsedDouble = double.parse('3.14');

  print('Number to string: $numStr');
  print('Parsed int: $parsed');
  print('Parsed double: $parsedDouble');
}

// Демонстрація рядків
void demonstrateStrings() {
  print('\n--- Strings Demo ---');
  String first = 'Hello';
  String second = "World";

  // Інтерполяція
  print('$first, $second!');
  print('Length of "$first" is ${first.length}');

  // Мультирядковий рядок
  String multi = '''
This is
a multi-line
string
''';
  print(multi);

  // Escape-послідовності
  print('I\'m learning Dart');
  print("He said: \"Dart is cool!\"");

  // Методи рядків
  print("Uppercase: ${second.toUpperCase()}");
  print("Replace example: ${"Dartlang".replaceAll("lang", "")}");
}

// Демонстрація булевих значень
void demonstrateBooleans() {
  print('\n--- Booleans Demo ---');
  bool isStudent = true;
  bool isWorking = false;

  print('Is student: $isStudent');
  print('Is working: $isWorking');

  // Логічні операції
  print('AND: ${isStudent && isWorking}');
  print('OR: ${isStudent || isWorking}');
  print('NOT: ${!isStudent}');

  // Умовний вираз
  int age = 18;
  print(age >= 18 ? 'Adult' : 'Minor');
}

// Демонстрація колекцій
void demonstrateCollections() {
  print('\n--- Collections Demo ---');

  // List
  List<int> numbers = [1, 2, 3, 4, 5];
  print('Numbers: $numbers');
  numbers.add(6);
  print('After add: $numbers');
  print('First element: ${numbers.first}');

  // Set
  Set<String> fruits = {'apple', 'banana', 'orange'};
  fruits.add('apple'); // дублікати ігноруються
  print('Fruits: $fruits');

  // Map
  Map<String, int> scores = {'Alice': 90, 'Bob': 85};
  scores['Charlie'] = 78;
  print('Scores: $scores');
  print('Alice score: ${scores['Alice']}');
}

// Демонстрація null safety
void demonstrateNullSafety() {
  print('\n--- Null Safety Demo ---');

  // Nullable тип
  String? nullableName;
  print('Nullable name: $nullableName');

  // Null-coalescing operator
  String name = nullableName ?? 'Default Name';
  print('Name after ?? : $name');

  // Late змінна
  late int value;
  value = 42;
  print('Late value: $value');

  // required параметри будуть показані у функціях (приклади далі)
}
