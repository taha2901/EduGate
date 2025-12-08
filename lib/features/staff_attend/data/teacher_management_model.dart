// features/admin/data/models/employee_model.dart
class EmployeeModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String employeeId;
  final String
  employeeType; // 'teacher', 'admin', 'cleaner', 'driver', 'security', 'maintenance'
  final String status; // 'active', 'inactive', 'on_leave'

  // Teacher-specific fields
  final String? department;
  final List<String>? subjects;
  final int? totalClasses;
  final int? totalStudents;
  final double? performanceScore;

  // Staff-specific fields
  final String? position;
  final String? workShift; // 'صباحي', 'مسائي', 'مناوبة'
  final double? salary;

  // Common fields
  final DateTime joinDate;
  final String? nationalId;
  final String? address;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.employeeId,
    required this.employeeType,
    required this.status,
    required this.joinDate,
    this.department,
    this.subjects,
    this.totalClasses,
    this.totalStudents,
    this.performanceScore,
    this.position,
    this.workShift,
    this.salary,
    this.nationalId,
    this.address,
  });

  // JSON Serialization
  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      name: json['name'],
      email: json['email'] ?? '',
      phone: json['phone'],
      employeeId: json['employeeId'],
      employeeType: json['employeeType'],
      status: json['status'],
      joinDate: DateTime.parse(json['joinDate']),
      department: json['department'],
      subjects: json['subjects'] != null
          ? List<String>.from(json['subjects'])
          : null,
      totalClasses: json['totalClasses'],
      totalStudents: json['totalStudents'],
      performanceScore: json['performanceScore']?.toDouble(),
      position: json['position'],
      workShift: json['workShift'],
      salary: json['salary']?.toDouble(),
      nationalId: json['nationalId'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'employeeId': employeeId,
      'employeeType': employeeType,
      'status': status,
      'joinDate': joinDate.toIso8601String(),
      'department': department,
      'subjects': subjects,
      'totalClasses': totalClasses,
      'totalStudents': totalStudents,
      'performanceScore': performanceScore,
      'position': position,
      'workShift': workShift,
      'salary': salary,
      'nationalId': nationalId,
      'address': address,
    };
  }

  // Copy With Method
  EmployeeModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? employeeId,
    String? employeeType,
    String? status,
    String? department,
    List<String>? subjects,
    int? totalClasses,
    int? totalStudents,
    double? performanceScore,
    String? position,
    String? workShift,
    double? salary,
    DateTime? joinDate,
    String? nationalId,
    String? address,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      employeeId: employeeId ?? this.employeeId,
      employeeType: employeeType ?? this.employeeType,
      status: status ?? this.status,
      joinDate: joinDate ?? this.joinDate,
      department: department ?? this.department,
      subjects: subjects ?? this.subjects,
      totalClasses: totalClasses ?? this.totalClasses,
      totalStudents: totalStudents ?? this.totalStudents,
      performanceScore: performanceScore ?? this.performanceScore,
      position: position ?? this.position,
      workShift: workShift ?? this.workShift,
      salary: salary ?? this.salary,
      nationalId: nationalId ?? this.nationalId,
      address: address ?? this.address,
    );
  }
}

class EmployeeDummyData {
  static List<EmployeeModel> getAllEmployees() {
    return [
      // ========== TEACHERS ==========
      EmployeeModel(
        id: 'T001',
        name: 'أ. محمد أحمد السيد',
        email: 'mohamed.ahmed@school.edu',
        phone: '01012345678',
        employeeId: 'T-2020-001',
        employeeType: 'teacher',
        department: 'رياضيات',
        subjects: ['جبر', 'هندسة', 'حساب مثلثات'],
        status: 'active',
        totalClasses: 5,
        totalStudents: 150,
        joinDate: DateTime(2020, 9, 1),
        performanceScore: 4.8,
        salary: 8000,
        nationalId: '29012345678901',
        address: 'المعادي، القاهرة',
      ),
      EmployeeModel(
        id: 'T002',
        name: 'أ. فاطمة حسن علي',
        email: 'fatma.hassan@school.edu',
        phone: '01098765432',
        employeeId: 'T-2019-002',
        employeeType: 'teacher',
        department: 'علوم',
        subjects: ['فيزياء', 'كيمياء', 'أحياء'],
        status: 'active',
        totalClasses: 6,
        totalStudents: 180,
        joinDate: DateTime(2019, 9, 1),
        performanceScore: 4.9,
        salary: 8500,
        nationalId: '28512345678901',
        address: 'مدينة نصر، القاهرة',
      ),
      EmployeeModel(
        id: 'T003',
        name: 'أ. أحمد سعيد محمود',
        email: 'ahmed.saeed@school.edu',
        phone: '01156789012',
        employeeId: 'T-2021-003',
        employeeType: 'teacher',
        department: 'لغة عربية',
        subjects: ['نحو', 'أدب', 'بلاغة', 'قراءة'],
        status: 'on_leave',
        totalClasses: 4,
        totalStudents: 120,
        joinDate: DateTime(2021, 2, 15),
        performanceScore: 4.6,
        salary: 7500,
        nationalId: '30112345678901',
        address: 'الزمالك، القاهرة',
      ),
      EmployeeModel(
        id: 'T004',
        name: 'أ. نورا خالد إبراهيم',
        email: 'nora.khaled@school.edu',
        phone: '01234567890',
        employeeId: 'T-2018-004',
        employeeType: 'teacher',
        department: 'لغة إنجليزية',
        subjects: ['Grammar', 'Conversation', 'Writing'],
        status: 'active',
        totalClasses: 7,
        totalStudents: 210,
        joinDate: DateTime(2018, 9, 1),
        performanceScore: 4.95,
        salary: 9000,
        nationalId: '27812345678901',
        address: 'الدقي، الجيزة',
      ),
      EmployeeModel(
        id: 'T005',
        name: 'أ. يوسف محمد عبدالله',
        email: 'youssef.mohamed@school.edu',
        phone: '01145678901',
        employeeId: 'T-2022-005',
        employeeType: 'teacher',
        department: 'تاريخ',
        subjects: ['تاريخ مصر القديم', 'تاريخ إسلامي', 'تاريخ حديث'],
        status: 'active',
        totalClasses: 4,
        totalStudents: 100,
        joinDate: DateTime(2022, 9, 1),
        performanceScore: 4.5,
        salary: 7000,
        nationalId: '31512345678901',
        address: 'مصر الجديدة، القاهرة',
      ),

      // ========== ADMINISTRATIVE STAFF ==========
      EmployeeModel(
        id: 'A001',
        name: 'محمود سعيد فهمي',
        email: 'mahmoud.saeed@school.edu',
        phone: '01087654321',
        employeeId: 'A-2018-001',
        employeeType: 'admin',
        position: 'مدير إداري',
        status: 'active',
        joinDate: DateTime(2018, 5, 1),
        workShift: 'صباحي',
        salary: 6500,
        nationalId: '27312345678901',
        address: 'المهندسين، الجيزة',
      ),
      EmployeeModel(
        id: 'A002',
        name: 'سارة خالد حسين',
        email: 'sara.khaled@school.edu',
        phone: '01198765432',
        employeeId: 'A-2021-002',
        employeeType: 'admin',
        position: 'سكرتيرة',
        status: 'active',
        joinDate: DateTime(2021, 3, 1),
        workShift: 'صباحي',
        salary: 4500,
        nationalId: '29812345678901',
        address: 'الهرم، الجيزة',
      ),
      EmployeeModel(
        id: 'A003',
        name: 'هشام أحمد عبدالرحمن',
        email: 'hesham.ahmed@school.edu',
        phone: '01134567890',
        employeeId: 'A-2019-003',
        employeeType: 'admin',
        position: 'محاسب',
        status: 'active',
        joinDate: DateTime(2019, 6, 15),
        workShift: 'صباحي',
        salary: 5500,
        nationalId: '28212345678901',
        address: '6 أكتوبر، الجيزة',
      ),
      EmployeeModel(
        id: 'A004',
        name: 'منى صلاح الدين',
        email: 'mona.salah@school.edu',
        phone: '01045678901',
        employeeId: 'A-2020-004',
        employeeType: 'admin',
        position: 'أمينة مكتبة',
        status: 'active',
        joinDate: DateTime(2020, 10, 1),
        workShift: 'صباحي',
        salary: 4000,
        nationalId: '29212345678901',
        address: 'شبرا، القاهرة',
      ),

      // ========== CLEANING STAFF ==========
      EmployeeModel(
        id: 'C001',
        name: 'أحمد حسين محمد',
        email: '',
        phone: '01156789012',
        employeeId: 'C-2022-001',
        employeeType: 'cleaner',
        position: 'عامل نظافة',
        status: 'active',
        joinDate: DateTime(2022, 1, 15),
        workShift: 'صباحي',
        salary: 3000,
        nationalId: '30812345678901',
        address: 'العمرانية، الجيزة',
      ),
      EmployeeModel(
        id: 'C002',
        name: 'محمد عبدالله حسن',
        email: '',
        phone: '01267890123',
        employeeId: 'C-2021-002',
        employeeType: 'cleaner',
        position: 'عامل نظافة',
        status: 'active',
        joinDate: DateTime(2021, 8, 1),
        workShift: 'صباحي',
        salary: 3000,
        nationalId: '29912345678901',
        address: 'إمبابة، الجيزة',
      ),
      EmployeeModel(
        id: 'C003',
        name: 'فاطمة علي محمود',
        email: '',
        phone: '01178901234',
        employeeId: 'C-2020-003',
        employeeType: 'cleaner',
        position: 'مشرفة نظافة',
        status: 'active',
        joinDate: DateTime(2020, 3, 1),
        workShift: 'صباحي',
        salary: 3500,
        nationalId: '28912345678901',
        address: 'المطرية، القاهرة',
      ),

      // ========== DRIVERS ==========
      EmployeeModel(
        id: 'D001',
        name: 'علي محمد إبراهيم',
        email: '',
        phone: '01089012345',
        employeeId: 'D-2019-001',
        employeeType: 'driver',
        position: 'سائق باص',
        status: 'active',
        joinDate: DateTime(2019, 8, 1),
        workShift: 'صباحي',
        salary: 4000,
        nationalId: '28412345678901',
        address: 'بولاق الدكرور، الجيزة',
      ),
      EmployeeModel(
        id: 'D002',
        name: 'كريم أحمد سعيد',
        email: '',
        phone: '01190123456',
        employeeId: 'D-2020-002',
        employeeType: 'driver',
        position: 'سائق باص',
        status: 'active',
        joinDate: DateTime(2020, 9, 1),
        workShift: 'صباحي',
        salary: 4000,
        nationalId: '29412345678901',
        address: 'فيصل، الجيزة',
      ),
      EmployeeModel(
        id: 'D003',
        name: 'حسام حسن علي',
        email: '',
        phone: '01201234567',
        employeeId: 'D-2021-003',
        employeeType: 'driver',
        position: 'مشرف نقل',
        status: 'active',
        joinDate: DateTime(2021, 9, 1),
        workShift: 'صباحي',
        salary: 4500,
        nationalId: '30212345678901',
        address: 'المنيل، القاهرة',
      ),

      // ========== SECURITY ==========
      EmployeeModel(
        id: 'S001',
        name: 'خالد عبدالله محمد',
        email: '',
        phone: '01112345678',
        employeeId: 'S-2020-001',
        employeeType: 'security',
        position: 'حارس أمن',
        status: 'active',
        joinDate: DateTime(2020, 6, 1),
        workShift: 'مناوبة',
        salary: 3500,
        nationalId: '29612345678901',
        address: 'شبرا الخيمة، القليوبية',
      ),
      EmployeeModel(
        id: 'S002',
        name: 'طارق سعيد حسن',
        email: '',
        phone: '01223456789',
        employeeId: 'S-2019-002',
        employeeType: 'security',
        position: 'حارس أمن',
        status: 'active',
        joinDate: DateTime(2019, 7, 1),
        workShift: 'مناوبة',
        salary: 3500,
        nationalId: '28612345678901',
        address: 'حدائق القبة، القاهرة',
      ),
      EmployeeModel(
        id: 'S003',
        name: 'وليد محمود أحمد',
        email: '',
        phone: '01134567890',
        employeeId: 'S-2021-003',
        employeeType: 'security',
        position: 'مشرف أمن',
        status: 'active',
        joinDate: DateTime(2021, 1, 1),
        workShift: 'صباحي',
        salary: 4000,
        nationalId: '30312345678901',
        address: 'عين شمس، القاهرة',
      ),

      // ========== MAINTENANCE ==========
      EmployeeModel(
        id: 'M001',
        name: 'حسن إبراهيم علي',
        email: '',
        phone: '01045678901',
        employeeId: 'M-2021-001',
        employeeType: 'maintenance',
        position: 'فني صيانة',
        status: 'active',
        joinDate: DateTime(2021, 11, 1),
        workShift: 'صباحي',
        salary: 4500,
        nationalId: '30612345678901',
        address: 'الوايلي، القاهرة',
      ),
      EmployeeModel(
        id: 'M002',
        name: 'سامي محمد حسن',
        email: '',
        phone: '01156789012',
        employeeId: 'M-2020-002',
        employeeType: 'maintenance',
        position: 'كهربائي',
        status: 'active',
        joinDate: DateTime(2020, 5, 1),
        workShift: 'صباحي',
        salary: 4500,
        nationalId: '29312345678901',
        address: 'الساحل، القاهرة',
      ),
      EmployeeModel(
        id: 'M003',
        name: 'عادل أحمد محمود',
        email: '',
        phone: '01267890123',
        employeeId: 'M-2019-003',
        employeeType: 'maintenance',
        position: 'سباك',
        status: 'active',
        joinDate: DateTime(2019, 4, 1),
        workShift: 'صباحي',
        salary: 4000,
        nationalId: '28112345678901',
        address: 'روض الفرج، القاهرة',
      ),
    ];
  }

  // Get employees by type
  static List<EmployeeModel> getEmployeesByType(String type) {
    if (type == 'all') return getAllEmployees();
    return getAllEmployees().where((e) => e.employeeType == type).toList();
  }

  // Get active employees
  static List<EmployeeModel> getActiveEmployees() {
    return getAllEmployees().where((e) => e.status == 'active').toList();
  }

  // Get employee by ID
  static EmployeeModel? getEmployeeById(String id) {
    try {
      return getAllEmployees().firstWhere((e) => e.id == id);
    } catch (e) {
      return null;
    }
  }

  // Search employees
  static List<EmployeeModel> searchEmployees(String query) {
    final lowerQuery = query.toLowerCase();
    return getAllEmployees().where((e) {
      return e.name.toLowerCase().contains(lowerQuery) ||
          e.employeeId.toLowerCase().contains(lowerQuery) ||
          (e.department?.toLowerCase().contains(lowerQuery) ?? false) ||
          (e.position?.toLowerCase().contains(lowerQuery) ?? false);
    }).toList();
  }

  // Get statistics
  static Map<String, int> getStatistics() {
    final employees = getAllEmployees();
    return {
      'total': employees.length,
      'teachers': employees.where((e) => e.employeeType == 'teacher').length,
      'admin': employees.where((e) => e.employeeType == 'admin').length,
      'cleaner': employees.where((e) => e.employeeType == 'cleaner').length,
      'driver': employees.where((e) => e.employeeType == 'driver').length,
      'security': employees.where((e) => e.employeeType == 'security').length,
      'maintenance': employees
          .where((e) => e.employeeType == 'maintenance')
          .length,
      'active': employees.where((e) => e.status == 'active').length,
      'inactive': employees.where((e) => e.status == 'inactive').length,
      'on_leave': employees.where((e) => e.status == 'on_leave').length,
    };
  }
}
