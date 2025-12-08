import 'package:edugate/features/send_notifications/ui/ection_card.dart';
import 'package:flutter/material.dart';

class PreviewWidget extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController messageController;
  final String notificationType;

  const PreviewWidget({super.key, 
    required this.titleController,
    required this.messageController,
    required this.notificationType,
  });

  @override
  Widget build(BuildContext context) {
    final title = titleController.text.isEmpty ? 'عنوان الإشعار' : titleController.text;
    final message = messageController.text.isEmpty ? 'نص الرسالة سيظهر هنا...' : messageController.text;

    return SectionCard(
      title: 'معاينة',
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _getNotificationColor(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(_getNotificationIcon(), color: Colors.white, size: 24),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('مدرسة المستقبل', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                    ],
                  ),
                ),
                Text('الآن', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ],
            ),
            SizedBox(height: 12),
            Divider(),
            SizedBox(height: 12),
            Text(message, style: TextStyle(fontSize: 14, height: 1.5)),
          ],
        ),
      ),
    );
  }

  Color _getNotificationColor() {
    switch (notificationType) {
      case 'urgent':
        return Colors.red;
      case 'event':
        return Colors.green;
      case 'payment':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  IconData _getNotificationIcon() {
    switch (notificationType) {
      case 'urgent':
        return Icons.priority_high;
      case 'event':
        return Icons.event;
      case 'payment':
        return Icons.payment;
      default:
        return Icons.info;
    }
  }
}
