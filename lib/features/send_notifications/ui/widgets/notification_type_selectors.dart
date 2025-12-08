import 'package:edugate/features/send_notifications/ui/ection_card.dart';
import 'package:edugate/features/send_notifications/ui/widgets/notification_type_selector.dart';
import 'package:flutter/material.dart';

class NotificationTypeSelectorWidget extends StatelessWidget {
  final String notificationType;
  final Function(String) onChanged;

  const NotificationTypeSelectorWidget({super.key, 
    required this.notificationType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'نوع الإشعار',
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: NotificationTypeChip(
                  label: 'عام',
                  icon: Icons.info,
                  value: 'general',
                  groupValue: notificationType,
                  color: Colors.blue,
                  onTap: () => onChanged('general'),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: NotificationTypeChip(
                  label: 'عاجل',
                  icon: Icons.priority_high,
                  value: 'urgent',
                  groupValue: notificationType,
                  color: Colors.red,
                  onTap: () => onChanged('urgent'),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: NotificationTypeChip(
                  label: 'حدث',
                  icon: Icons.event,
                  value: 'event',
                  groupValue: notificationType,
                  color: Colors.green,
                  onTap: () => onChanged('event'),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: NotificationTypeChip(
                  label: 'تنبيه مالي',
                  icon: Icons.payment,
                  value: 'payment',
                  groupValue: notificationType,
                  color: Colors.orange,
                  onTap: () => onChanged('payment'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
