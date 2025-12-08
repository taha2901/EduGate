import 'package:edugate/features/send_notifications/ui/ection_card.dart';
import 'package:flutter/material.dart';

class DeliveryOptionsWidget extends StatelessWidget {
  final bool sendSMS;
  final bool sendEmail;
  final Function(bool) onSMSChanged;
  final Function(bool) onEmailChanged;

  const DeliveryOptionsWidget({super.key, 
    required this.sendSMS,
    required this.sendEmail,
    required this.onSMSChanged,
    required this.onEmailChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'طرق التوصيل',
      child: Column(
        children: [
          SwitchListTile(
            value: true,
            onChanged: null,
            title: Text('إشعار داخل التطبيق'),
            subtitle: Text('سيتم إرساله تلقائياً'),
            secondary: Icon(Icons.notifications, color: Color(0xFF7C3AED)),
            activeColor: Color(0xFF7C3AED),
          ),
          Divider(),
          SwitchListTile(
            value: sendSMS,
            onChanged: onSMSChanged,
            title: Text('رسالة SMS'),
            subtitle: Text('تكلفة إضافية قد تطبق'),
            secondary: Icon(Icons.sms, color: sendSMS ? Colors.green : Colors.grey),
            activeColor: Colors.green,
          ),
          Divider(),
          SwitchListTile(
            value: sendEmail,
            onChanged: onEmailChanged,
            title: Text('بريد إلكتروني'),
            subtitle: Text('سيتم الإرسال للبريد المسجل'),
            secondary: Icon(Icons.email, color: sendEmail ? Colors.blue : Colors.grey),
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
