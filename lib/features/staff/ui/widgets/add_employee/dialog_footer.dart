import 'package:edugate/core/widgets/common/app_text_button.dart';
import 'package:flutter/material.dart';

class DialogFooter extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSubmit;
  final bool isLoading;
  final String submitText;

  const DialogFooter({
    super.key,
    required this.onCancel,
    required this.onSubmit,
    this.isLoading = false,
    this.submitText = 'إضافة الموظف',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppTextButton(
              buttonText: 'إلغاء',
              textStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                fontWeight: FontWeight.w600,
              ),
              backgroundColor: Colors.white,
              borderRadius: 12,
              onPressed: onCancel,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: AppTextButton(
              buttonText: submitText,
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              backgroundColor: Color(0xFF7C3AED),
              icon: Icons.check,
              borderRadius: 12,
              isLoading: isLoading,
              onPressed: onSubmit,
            ),
          ),
        ],
      ),
    );
  }
}
