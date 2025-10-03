int calculateSum(int a, int b) => a + b;


double calculateAverage(List<double> numbers) {
if (numbers.isEmpty) return 0.0;
return numbers.reduce((v, e) => v + e) / numbers.length;
}


String formatName(String firstName, String lastName,
{String? middleName, bool uppercase = false}) {
var full = [firstName, if (middleName != null) middleName, lastName].join(' ');
return uppercase ? full.toUpperCase() : full;
}


void testFunctionalProgramming() {
var numbers = [1, 2, 3, 4, 5];
var squares = numbers.map((n) => n * n).toList();
var evens = numbers.where((n) => n.isEven).toList();
var sum = numbers.fold(0, (p, e) => p + e);
print('squares: \$squares, evens: \$evens, sum: \$sum');


Function makeAdder(int x) {
return (int y) => x + y;
}
var add5 = makeAdder(5);
print('add5(3) = \${add5(3)}');
}


int fibonacci(int n) {
if (n <= 0) return 0;
if (n == 1) return 1;
return fibonacci(n - 1) + fibonacci(n - 2);
}


int factorial(int n) {
if (n <= 1) return 1;
return n * factorial(n - 1);
}


void main() {
print('=== Dart Functions Demo ===');
print('sum: \${calculateSum(3, 4)}');
print('avg: \${calculateAverage([2.0, 4.0, 6.0])}');
print('name: \${formatName('Nikita', 'Bondarenko', uppercase: true)}');
testFunctionalProgramming();
print('fib(8)=\${fibonacci(8)}, fact(5)=\${factorial(5)}');
}