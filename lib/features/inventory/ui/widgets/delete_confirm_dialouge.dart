import 'package:edugate/core/widgets/common/app_text_button.dart';
import 'package:flutter/material.dart';

class DeleteConfirmDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const DeleteConfirmDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Row(
        children: [
          Icon(Icons.warning, color: Colors.red, size: 28),
          SizedBox(width: 12),
          Text('تأكيد الحذف'),
        ],
      ),
      content: Text('هل أنت متأكد من الحذف؟'),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('إلغاء')),
        AppTextButton(
          buttonText: 'حذف',
          textStyle: TextStyle(fontSize: 14, color: Colors.white),
          backgroundColor: Colors.red,
          buttonHeight: 40,
          buttonWidth: 80,
          borderRadius: 8,
          onPressed: onConfirm,
        ),
      ],
    );
  }
}
