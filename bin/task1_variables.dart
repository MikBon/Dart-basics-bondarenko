void main() {
print('=== Dart Variables & Types Demo ===');
demonstrateNumbers();
demonstrateStrings();
demonstrateBooleans();
demonstrateCollections();
demonstrateNullSafety();
}


void demonstrateNumbers() {
int a = 5;
double b = 3.14;
num c = 7; // може бути int або double
print('a + b = \${a + b}');
print('c runtimeType: \${c.runtimeType}');
double converted = a.toDouble();
int fromDouble = b.toInt();
print('converted: \$converted, fromDouble: \$fromDouble');
}


void demonstrateStrings() {
String s1 = 'Hello';
String s2 = "Dart";
String multi = '''This is
multi-line string.''';
print('\$s1, \$s2! length: \${s2.length}');
print(multi);
print('Interpolated: \${s1.toUpperCase()} - \$s2');
print('Replace example: \${'Dartlang'.replaceAll('lang', '')}');
}


void demonstrateBooleans() {
bool t = true;
bool f = false;
print('t && f = \${t && f}, t || f = \${t || f}');
print('Comparison: 5 > 3 = \${5 > 3}');
}


void demonstrateCollections() {
List<int> list = [1, 2, 3];
Set<String> set = {'a', 'b', 'a'};
Map<String, int> map = {'one': 1, 'two': 2};
print('List: \$list, Set: \$set, Map: \$map');
print('map keys: \${map.keys.toList()}');
}


void demonstrateNullSafety() {
String? maybe;
print('nullable is null: \${maybe == null}');
maybe ??= 'default';
print('coalesced: \$maybe');
late String lateVar;
lateVar = 'initialized later';
print(lateVar);
}