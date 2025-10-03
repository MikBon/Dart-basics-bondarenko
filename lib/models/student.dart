class Student {
final String id;
final String firstName;
final String lastName;
final DateTime birthDate;
final List<String> enrolledCourses;
final Map<String, double> grades;


Student({
required this.id,
required this.firstName,
required this.lastName,
required this.birthDate,
List<String>? enrolledCourses,
Map<String, double>? grades,
}) : enrolledCourses = enrolledCourses ?? [],
grades = grades ?? {};


String get fullName => '\$firstName \$lastName';


int get age {
final now = DateTime.now();
int age = now.year - birthDate.year;
if (now.month < birthDate.month ||
(now.month == birthDate.month && now.day < birthDate.day)) {
age -= 1;
}
return age;
}


double get gpa {
if (grades.isEmpty) return 0.0;
final sum = grades.values.reduce((a, b) => a + b);
return sum / grades.length;
}


void enrollInCourse(String courseId) {
if (!enrolledCourses.contains(courseId)) enrolledCourses.add(courseId);
}


void addGrade(String courseId, double grade) {
grades[courseId] = grade;
}


List<String> getPassedCourses() {
return grades.entries.where((e) => e.value >= 60).map((e) => e.key).toList();
}


@override
String toString() => 'Student(\$id): \$fullName, age: \$age, gpa: \${gpa.toStringAsFixed(2)}';


Map<String, dynamic> toJson() => {
'id': id,
'firstName': firstName,
'lastName': lastName,
'birthDate': birthDate.toIso8601String(),
'enrolledCourses': enrolledCourses,
'grades': grades,
};


factory Student.fromJson(Map<String, dynamic> json) {
return Student(
id: json['id'] as String,
firstName: json['firstName'] as String,
lastName: json['lastName'] as String,
birthDate: DateTime.parse(json['birthDate'] as String),
enrolledCourses: (json['enrolledCourses'] as List<dynamic>?)?.cast<String>(),
grades: (json['grades'] as Map<String, dynamic>?)?.map((k, v) => MapEntry(k, (v as num).toDouble())),
);
}
}