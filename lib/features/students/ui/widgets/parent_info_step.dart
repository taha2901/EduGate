import 'package:edugate/core/widgets/common/app_text_form_field.dart';
import 'package:flutter/material.dart';

class ParentInfoStep extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController jobController;
  final TextEditingController addressController;

  const ParentInfoStep({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.jobController,
    required this.addressController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('بيانات ولي الأمر'),
        SizedBox(height: 16),
        UniversalFormField(
          controller: nameController,
          hintText: 'اسم ولي الأمر',
          prefixIcon: Icon(Icons.person, color: Color(0xFF7C3AED)),
          validator: (value) => value?.isEmpty ?? true ? 'مطلوب' : null,
        ),
        SizedBox(height: 16),
        UniversalFormField(
          controller: phoneController,
          hintText: 'رقم الهاتف',
          prefixIcon: Icon(Icons.phone, color: Color(0xFF7C3AED)),
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value?.isEmpty ?? true) return 'مطلوب';
            if (value!.length != 11) return 'يجب أن يكون 11 رقم';
            return null;
          },
        ),
        SizedBox(height: 16),
        UniversalFormField(
          controller: emailController,
          hintText: 'البريد الإلكتروني (اختياري)',
          prefixIcon: Icon(Icons.email, color: Color(0xFF7C3AED)),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16),
        UniversalFormField(
          controller: jobController,
          hintText: 'الوظيفة',
          prefixIcon: Icon(Icons.work, color: Color(0xFF7C3AED)),
        ),
        SizedBox(height: 16),
        UniversalFormField(
          controller: addressController,
          hintText: 'العنوان',
          prefixIcon: Icon(Icons.location_on, color: Color(0xFF7C3AED)),
          maxLines: 2,
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: Color(0xFF7C3AED),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF7C3AED),
          ),
        ),
      ],
    );
  }
}
