// core/routings/app_router.dart
import 'package:edugate/core/routings/routers.dart';
import 'package:edugate/features/finance_report/ui/financial_reports_screen.dart';
import 'package:edugate/features/inventory/ui/inventory_screen.dart';
import 'package:edugate/features/record_payment/ui/record_payment_screen.dart';
import 'package:edugate/features/send_notifications/ui/send_notification_screen.dart';
import 'package:edugate/features/staff_attend/ui/staff_attendance_screen.dart';
import 'package:edugate/features/students/ui/student_registration_screen.dart';
import 'package:edugate/core/widgets/common/admin_bottom_nav_bar.dart';
import 'package:edugate/features/auth/ui/screens/login_scren.dart';
import 'package:edugate/features/auth/ui/screens/splash_screen.dart';

// Admin Imports
import 'package:edugate/features/dashboard/ui/admin_dashboard.dart';
import 'package:edugate/features/staff/ui/teachers_management_screen.dart';
import 'package:edugate/features/students/ui/students_management_screen.dart';
import 'package:edugate/features/announcements/ui/announcements_screen.dart';

import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // ===== Auth Routes =====
      case Routers.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routers.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      // ===== Navigation Routes =====
      case Routers.adminHome:
        return MaterialPageRoute(builder: (_) => const AdminBottomNavBar());

      // ===== Admin Routes =====
      case Routers.adminDashboard:
        return MaterialPageRoute(builder: (_) => const AdminDashboard());
      case Routers.teachersManagement:
        return MaterialPageRoute(
          builder: (_) => const TeachersManagementScreen(),
        );
      case Routers.studentsManagement:
        return MaterialPageRoute(
          builder: (_) => const StudentsManagementScreen(),
        );
      case Routers.announcements:
        return MaterialPageRoute(builder: (_) => const AnnouncementsScreen());

      // ===== New School Management Routes =====
      case Routers.studentRegistration:
        return MaterialPageRoute(
          builder: (_) => const StudentRegistrationScreen(),
        );
      case Routers.recordPayment:
        return MaterialPageRoute(builder: (_) => const RecordPaymentScreen());
      case Routers.financialReports:
        return MaterialPageRoute(
          builder: (_) => const FinancialReportsScreen(),
        );
      case Routers.staffAttendance:
        return MaterialPageRoute(builder: (_) => const StaffAttendanceScreen());
      case Routers.inventory:
        return MaterialPageRoute(builder: (_) => const InventoryScreen());
      case Routers.sendNotification:
        return MaterialPageRoute(
          builder: (_) => const SendNotificationScreen(),
        );
      default:
        return null;
    }
  }
}
