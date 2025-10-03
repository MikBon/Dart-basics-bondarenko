import 'package:test/test.dart';
import '../lib/utils/data_processor.dart';

void main() {
  test('count words', () {
    final map = DataProcessor.countWords('hello world hello');
    expect(map['hello'], 2);
    expect(map['world'], 1);
  });
}
