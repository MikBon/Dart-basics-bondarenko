void main() {
  print('=== Dart Functions Demo ===');
  testBasicFunctions();
  testAdvancedFunctions();
  testFunctionalProgramming();
}

void testBasicFunctions() {
  print('\n--- Basic Functions ---');
  print('Sum of 4 + 6 = ${calculateSum(4, 6)}');
  print('Average of [2.0, 4.0, 6.0] = ${calculateAverage([2.0, 4.0, 6.0])}');
}

void testAdvancedFunctions() {
  print('\n--- Advanced Functions ---');
  print(formatName("Nikita", "Bondarenko"));
  print(formatName("Ivan", "Petrov", middleName: "Olegovich", uppercase: true));

  print('Fibonacci(7): ${fibonacci(7)}');
  print('Factorial(5): ${factorial(5)}');
}

// 1. Звичайні функції
int calculateSum(int a, int b) => a + b;

double calculateAverage(List<double> numbers) {
  if (numbers.isEmpty) return 0;
  return numbers.reduce((a, b) => a + b) / numbers.length;
}

// 2. Необов'язкові та іменовані параметри
String formatName(String firstName, String lastName,
    {String? middleName, bool uppercase = false}) {
  String fullName =
      middleName != null ? "$firstName $middleName $lastName" : "$firstName $lastName";
  return uppercase ? fullName.toUpperCase() : fullName;
}

// 3. Анонімні функції та замикання
void testFunctionalProgramming() {
  print('\n--- Functional Programming ---');
  List<int> numbers = [1, 2, 3, 4, 5];

  var squared = numbers.map((n) => n * n);
  print('Squared: $squared');

  var evens = numbers.where((n) => n.isEven);
  print('Even numbers: $evens');

  var sum = numbers.fold(0, (prev, n) => prev + n);
  print('Sum using fold: $sum');

  Function makeMultiplier(int factor) {
    return (int x) => x * factor;
  }

  var doubleIt = makeMultiplier(2);
  print('Double 5 = ${doubleIt(5)}');
}

// 4. Функція рекурсії
int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}
