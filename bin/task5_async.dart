import 'dart:async';
import 'dart:io';
import 'dart:convert';

void main() async {
  print('=== Dart Async Programming Demo ===');
  await demonstrateFutures();
  await demonstrateStreams();
  await demonstrateFileOperations();
}

// Future demo
Future<void> demonstrateFutures() async {
  print('\n--- Futures Demo ---');
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    return "Student Data Loaded";
  }

  try {
    var result = await fetchData().timeout(Duration(seconds: 2));
    print(result);
  } catch (e) {
    print('Error: $e');
  }
}

// Stream demo
Future<void> demonstrateStreams() async {
  print('\n--- Streams Demo ---');
  Stream<int> numberStream() async* {
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(Duration(milliseconds: 500));
      yield i;
    }
  }

  await for (var n in numberStream()) {
    print('Stream value: $n');
  }
}

// File operations demo
Future<void> demonstrateFileOperations() async {
  print('\n--- File Operations Demo ---');
  String filename = "students.json";

  // Sample data
  List<Map<String, dynamic>> students = [
    {"id": "S1", "name": "Alice", "gpa": 3.5},
    {"id": "S2", "name": "Bob", "gpa": 4.0}
  ];

  // Save to file
  var file = File(filename);
  await file.writeAsString(jsonEncode(students));
  print('Data saved to $filename');

  // Read file
  String content = await file.readAsString();
  var decoded = jsonDecode(content);
  print('Data loaded: $decoded');
}
