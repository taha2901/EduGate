// features/admin/staff/ui/widgets/employee_helpers.dart
import 'package:flutter/material.dart';

class EmployeeHelpers {
  // Get Employee Type Color
  static Color getEmployeeTypeColor(String type) {
    switch (type) {
      case 'teacher':
        return Colors.purple;
      case 'admin':
        return Colors.blue;
      case 'cleaner':
        return Colors.teal;
      case 'driver':
        return Colors.orange;
      case 'security':
        return Colors.red;
      case 'maintenance':
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }

  // Get Employee Type Icon
  static IconData getEmployeeTypeIcon(String type) {
    switch (type) {
      case 'teacher':
        return Icons.school;
      case 'admin':
        return Icons.admin_panel_settings;
      case 'cleaner':
        return Icons.cleaning_services;
      case 'driver':
        return Icons.directions_bus;
      case 'security':
        return Icons.security;
      case 'maintenance':
        return Icons.build;
      default:
        return Icons.person;
    }
  }

  // Get Employee Type Label
  static String getEmployeeTypeLabel(String type) {
    switch (type) {
      case 'teacher':
        return 'معلم';
      case 'admin':
        return 'إداري';
      case 'cleaner':
        return 'نظافة';
      case 'driver':
        return 'سائق';
      case 'security':
        return 'أمن';
      case 'maintenance':
        return 'صيانة';
      default:
        return type;
    }
  }

  // Get Status Color
  static Color getStatusColor(String status) {
    switch (status) {
      case 'active':
        return Colors.green;
      case 'inactive':
        return Colors.red;
      case 'on_leave':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  // Get Status Text
  static String getStatusText(String status) {
    switch (status) {
      case 'active':
        return 'نشط';
      case 'inactive':
        return 'غير نشط';
      case 'on_leave':
        return 'في إجازة';
      default:
        return status;
    }
  }

  // Get Status Icon
  static IconData getStatusIcon(String status) {
    switch (status) {
      case 'active':
        return Icons.check_circle;
      case 'inactive':
        return Icons.cancel;
      case 'on_leave':
        return Icons.event_busy;
      default:
        return Icons.help;
    }
  }

  // Format Salary
  static String formatSalary(double? salary) {
    if (salary == null) return '-';
    return '${salary.toStringAsFixed(0)} ج.م';
  }

  // Format Date
  static String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  // Calculate Years of Service
  static int calculateYearsOfService(DateTime joinDate) {
    return DateTime.now().difference(joinDate).inDays ~/ 365;
  }

  // Get Work Shift Icon
  static IconData getWorkShiftIcon(String? shift) {
    switch (shift) {
      case 'صباحي':
        return Icons.wb_sunny;
      case 'مسائي':
        return Icons.nights_stay;
      case 'مناوبة':
        return Icons.access_time;
      default:
        return Icons.schedule;
    }
  }

  // Get Work Shift Color
  static Color getWorkShiftColor(String? shift) {
    switch (shift) {
      case 'صباحي':
        return Colors.amber;
      case 'مسائي':
        return Colors.indigo;
      case 'مناوبة':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}
