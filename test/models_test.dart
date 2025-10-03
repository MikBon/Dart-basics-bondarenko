import 'package:test/test.dart';
import '../lib/models/student.dart';

void main() {
  test('student gpa empty', () {
    final s = Student(id: 's', firstName: 'A', lastName: 'B', birthDate: DateTime(2000));
    expect(s.gpa, 0.0);
  });
}
