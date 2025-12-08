import 'package:edugate/core/widgets/common/app_text_form_field.dart';
import 'package:flutter/material.dart';

class BasicInfoSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController employeeIdController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController salaryController;

  const BasicInfoSection({
    super.key,
    required this.nameController,
    required this.employeeIdController,
    required this.phoneController,
    required this.emailController,
    required this.salaryController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('البيانات الأساسية', Icons.person),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: UniversalFormField(
                controller: nameController,
                hintText: 'الاسم الكامل',
                prefixIcon: Icon(Icons.person, color: Color(0xFF7C3AED)),
                validator: (value) => value?.isEmpty ?? true ? 'مطلوب' : null,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: UniversalFormField(
                controller: employeeIdController,
                hintText: 'الرقم الوظيفي',
                prefixIcon: Icon(Icons.badge, color: Color(0xFF7C3AED)),
                validator: (value) => value?.isEmpty ?? true ? 'مطلوب' : null,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: UniversalFormField(
                controller: phoneController,
                hintText: 'رقم الجوال',
                prefixIcon: Icon(Icons.phone, color: Color(0xFF7C3AED)),
                keyboardType: TextInputType.phone,
                validator: (value) => value?.isEmpty ?? true ? 'مطلوب' : null,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: UniversalFormField(
                controller: emailController,
                hintText: 'البريد الإلكتروني (اختياري)',
                prefixIcon: Icon(Icons.email, color: Color(0xFF7C3AED)),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        UniversalFormField(
          controller: salaryController,
          hintText: 'الراتب الشهري',
          prefixIcon: Icon(Icons.attach_money, color: Color(0xFF7C3AED)),
          suffixText: 'ج.م',
          keyboardType: TextInputType.number,
          validator: (value) => value?.isEmpty ?? true ? 'مطلوب' : null,
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Color(0xFF7C3AED), size: 20),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF7C3AED),
          ),
        ),
      ],
    );
  }
}
