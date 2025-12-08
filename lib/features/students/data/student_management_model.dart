class StudentManagementModel {
  final String id;
  final String name;
  final String studentId;
  final String email;
  final String grade;
  final String section;
  final String status;
  final String? parentName;
  final String? parentPhone;
  final String? parentEmail;
  final double? gpa;
  final double? attendanceRate;
  final DateTime enrollmentDate;

  StudentManagementModel({
    required this.id,
    required this.name,
    required this.studentId,
    required this.email,
    required this.grade,
    required this.section,
    required this.status,
    this.parentName,
    this.parentPhone,
    this.parentEmail,
    this.gpa,
    this.attendanceRate,
    required this.enrollmentDate,
  });

  factory StudentManagementModel.fromJson(Map<String, dynamic> json) {
    return StudentManagementModel(
      id: json['id'],
      name: json['name'],
      studentId: json['studentId'],
      email: json['email'],
      grade: json['grade'],
      section: json['section'],
      status: json['status'],
      parentName: json['parentName'],
      parentPhone: json['parentPhone'],
      parentEmail: json['parentEmail'],
      gpa: (json['gpa'] ?? 0).toDouble(),
      attendanceRate: (json['attendanceRate'] ?? 0).toDouble(),
      enrollmentDate: DateTime.parse(json['enrollmentDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'studentId': studentId,
      'email': email,
      'grade': grade,
      'section': section,
      'status': status,
      'parentName': parentName,
      'parentPhone': parentPhone,
      'parentEmail': parentEmail,
      'gpa': gpa,
      'attendanceRate': attendanceRate,
      'enrollmentDate': enrollmentDate.toIso8601String(),
    };
  }

  /// ----------------------------
  /// 🔥 Dummy Data هنا
  /// ----------------------------
  static List<StudentManagementModel> dummyStudents = [
    StudentManagementModel(
      id: '1',
      name: 'أحمد محمد علي',
      studentId: 'S001',
      email: 'ahmed@student.edu.sa',
      grade: '10',
      section: 'أ',
      status: 'active',
      parentName: 'محمد علي',
      parentPhone: '0501111111',
      parentEmail: 'parent1@email.com',
      gpa: 3.8,
      attendanceRate: 95.0,
      enrollmentDate: DateTime(2023, 9, 1),
    ),
    StudentManagementModel(
      id: '2',
      name: 'فاطمة حسن',
      studentId: 'S002',
      email: 'fatma@student.edu.sa',
      grade: '10',
      section: 'أ',
      status: 'active',
      parentName: 'حسن أحمد',
      parentPhone: '0502222222',
      parentEmail: 'parent2@email.com',
      gpa: 4.0,
      attendanceRate: 98.0,
      enrollmentDate: DateTime(2023, 9, 1),
    ),
    StudentManagementModel(
      id: '3',
      name: 'محمود سعيد',
      studentId: 'S003',
      email: 'mahmoud@student.edu.sa',
      grade: '11',
      section: 'ب',
      status: 'active',
      parentName: 'سعيد محمود',
      parentPhone: '0503333333',
      parentEmail: 'parent3@email.com',
      gpa: 3.5,
      attendanceRate: 88.0,
      enrollmentDate: DateTime(2022, 9, 1),
    ),
  ];
}
