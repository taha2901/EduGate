class Routers {
  // ===== Auth Routes =====
  static const String splashScreen = '/';
  static const String login = '/login';

  // ===== Navigation Routes =====
  static const String adminHome = '/admin';

  // ===== Admin Routes =====
  static const String adminDashboard = '/admin-dashboard';
  static const String teachersManagement = '/admin/teachers';
  static const String addTeacher = '/admin/teachers/add';
  static const String studentsManagement = '/admin/students';
  static const String addStudent = '/admin/students/add';
  static const String classesManagement = '/admin/classes';
  static const String createClass = '/admin/classes/create';
  static const String analytics = '/admin/analytics';
  static const String announcements = '/admin/announcements';
  static const String adminSettings = '/admin/settings';

  // ===== New School Management Routes =====
  static const String studentRegistration = '/admin/student-registration';
  static const String recordPayment = '/admin/record-payment';
  static const String financialReports = '/admin/financial-reports';
  static const String staffAttendance = '/admin/staff-attendance';
  static const String inventory = '/admin/inventory';
  static const String sendNotification = '/admin/send-notification';
  // Inventory Routes
  static const String stockMovement = '/admin/inventory/stock-movement';
  static const String transactionHistory =
      '/admin/inventory/transaction-history';
  static const String inventoryReports = '/admin/inventory/reports';
}
