
import 'package:edugate/core/widgets/common/app_text_form_field.dart';
import 'package:edugate/features/send_notifications/ui/ection_card.dart';
import 'package:flutter/material.dart';

class BasicInfoWidget extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController messageController;

  const BasicInfoWidget({super.key, 
    required this.titleController,
    required this.messageController,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'محتوى الإشعار',
      child: Column(
        children: [
          UniversalFormField(
            controller: titleController,
            hintText: 'عنوان الإشعار',
            prefixIcon: Icon(Icons.title, color: Color(0xFF7C3AED)),
            validator: (value) => value?.isEmpty ?? true ? 'مطلوب' : null,
          ),
          SizedBox(height: 16),
          UniversalFormField(
            controller: messageController,
            hintText: 'نص الرسالة',
            prefixIcon: Icon(Icons.message, color: Color(0xFF7C3AED)),
            maxLines: 5,
            validator: (value) => value?.isEmpty ?? true ? 'مطلوب' : null,
          ),
        ],
      ),
    );
  }
}
