import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final bool scheduled;
  final String? scheduleTime;

  const SuccessDialog({super.key, required this.scheduled, this.scheduleTime});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        constraints: BoxConstraints(maxWidth: 400),
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(scheduled ? Icons.schedule_send : Icons.check_circle, color: scheduled ? Colors.orange : Colors.green, size: 80),
            SizedBox(height: 24),
            Text(scheduled ? 'تم الجدولة بنجاح!' : 'تم الإرسال بنجاح!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            SizedBox(height: 16),
            Text(
              scheduled ? 'سيتم إرسال الإشعار في:\n$scheduleTime' : 'تم إرسال الإشعار إلى جميع المستلمين المحددين',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('تم'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7C3AED),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
