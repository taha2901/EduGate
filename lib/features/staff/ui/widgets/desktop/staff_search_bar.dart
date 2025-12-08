import 'package:edugate/core/widgets/common/app_text_button.dart';
import 'package:edugate/core/widgets/common/app_text_form_field.dart';
import 'package:flutter/material.dart';

class StaffSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearchChanged;
  final VoidCallback? onExport;

  const StaffSearchBar({
    super.key,
    required this.controller,
    required this.onSearchChanged,
    this.onExport,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: UniversalFormField(
            controller: controller,
            hintText: 'ابحث عن موظف (الاسم، الرقم الوظيفي، القسم)...',
            hintStyle: TextStyle(fontSize: 14),
            prefixIcon: Icon(Icons.search, color: Color(0xFF7C3AED)),
            suffixIcon: controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      controller.clear();
                      onSearchChanged('');
                    },
                  )
                : null,
            onChanged: onSearchChanged,
            backgroundColor: Colors.white,
          ),
        ),
        SizedBox(width: 16),
        AppTextButton(
          buttonText: 'تصدير',
          icon: Icons.download,
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.grey,
          horizontalPadding: 24,
          verticalPadding: 20,
          borderRadius: 12,
          onPressed: onExport ?? () {},
        ),
      ],
    );
  }
}
