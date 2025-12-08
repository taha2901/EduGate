// features/admin/announcements/ui/widgets/mobile/announcement_helpers.dart
import 'package:flutter/material.dart';

class AnnouncementHelpers {
  // Get Priority Color
  static Color getPriorityColor(String priority) {
    switch (priority) {
      case 'urgent':
        return Colors.red;
      case 'high':
        return Colors.orange;
      case 'medium':
        return Colors.blue;
      case 'low':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  // Get Priority Icon
  static IconData getPriorityIcon(String priority) {
    switch (priority) {
      case 'urgent':
        return Icons.error;
      case 'high':
        return Icons.priority_high;
      case 'medium':
        return Icons.info;
      case 'low':
        return Icons.notifications;
      default:
        return Icons.notifications;
    }
  }

  // Get Priority Text
  static String getPriorityText(String priority) {
    switch (priority) {
      case 'urgent':
        return 'عاجل';
      case 'high':
        return 'مهم';
      case 'medium':
        return 'متوسط';
      case 'low':
        return 'عادي';
      default:
        return priority;
    }
  }

  // Get Target Audience Text
  static String getTargetText(String target) {
    switch (target) {
      case 'all':
        return 'الجميع';
      case 'students':
        return 'الطلاب';
      case 'teachers':
        return 'المعلمين';
      case 'parents':
        return 'أولياء الأمور';
      default:
        return target;
    }
  }

  // Get Target Audience Icon
  static IconData getTargetIcon(String target) {
    switch (target) {
      case 'all':
        return Icons.groups;
      case 'students':
        return Icons.school;
      case 'teachers':
        return Icons.person;
      case 'parents':
        return Icons.family_restroom;
      default:
        return Icons.people;
    }
  }

  // Format Time Ago
  static String getTimeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return 'الآن';
    } else if (difference.inMinutes < 60) {
      return 'منذ ${difference.inMinutes} دقيقة';
    } else if (difference.inHours < 24) {
      return 'منذ ${difference.inHours} ساعة';
    } else if (difference.inDays < 7) {
      return 'منذ ${difference.inDays} يوم';
    } else if (difference.inDays < 30) {
      return 'منذ ${(difference.inDays / 7).floor()} أسبوع';
    } else if (difference.inDays < 365) {
      return 'منذ ${(difference.inDays / 30).floor()} شهر';
    } else {
      return 'منذ ${(difference.inDays / 365).floor()} سنة';
    }
  }

  // Format Date
  static String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  // Check if Announcement is Expired
  static bool isExpired(DateTime? expiryDate) {
    if (expiryDate == null) return false;
    return DateTime.now().isAfter(expiryDate);
  }

  // Get Days Until Expiry
  static int? getDaysUntilExpiry(DateTime? expiryDate) {
    if (expiryDate == null) return null;
    final difference = expiryDate.difference(DateTime.now());
    return difference.inDays;
  }
}
