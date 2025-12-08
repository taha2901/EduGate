import 'package:edugate/core/widgets/common/app_text_form_field.dart';
import 'package:flutter/material.dart';

class StudentInfoStep extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController birthDateController;
  final TextEditingController nationalIdController;
  final TextEditingController addressController;
  final String selectedGrade;
  final String selectedGender;
  final Function(String) onGradeChanged;
  final Function(String) onGenderChanged;

  const StudentInfoStep({
    super.key,
    required this.nameController,
    required this.birthDateController,
    required this.nationalIdController,
    required this.addressController,
    required this.selectedGrade,
    required this.selectedGender,
    required this.onGradeChanged,
    required this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('المعلومات الشخصية'),
        SizedBox(height: 16),
        UniversalFormField(
          controller: nameController,
          hintText: 'اسم الطالب رباعي',
          prefixIcon: Icon(Icons.person, color: Color(0xFF7C3AED)),
          validator: (value) => value?.isEmpty ?? true ? 'مطلوب' : null,
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: UniversalFormField(
                controller: birthDateController,
                hintText: 'تاريخ الميلاد',
                prefixIcon: Icon(Icons.calendar_today, color: Color(0xFF7C3AED)),
                isDatePicker: true,
                dateFormat: 'dd/MM/yyyy',
                onDateSelected: (date) {
                  birthDateController.text = date.toString().split(' ')[0];
                },
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: UniversalFormField(
                hintText: 'النوع',
                prefixIcon: Icon(Icons.wc, color: Color(0xFF7C3AED)),
                hasDropdown: true,
                dropdownItems: ['male', 'female'],
                dropdownItemLabels: {
                  'male': 'ذكر',
                  'female': 'أنثى',
                },
                initialDropdownValue: selectedGender,
                onDropdownChanged: (value) => onGenderChanged(value!),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        UniversalFormField(
          controller: nationalIdController,
          hintText: 'الرقم القومي',
          prefixIcon: Icon(Icons.badge, color: Color(0xFF7C3AED)),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value?.isEmpty ?? true) return 'مطلوب';
            if (value!.length != 14) return 'يجب أن يكون 14 رقم';
            return null;
          },
        ),
        SizedBox(height: 32),
        _buildSectionTitle('معلومات الدراسة'),
        SizedBox(height: 16),
        UniversalFormField(
          hintText: 'الصف الدراسي',
          prefixIcon: Icon(Icons.school, color: Color(0xFF7C3AED)),
          hasDropdown: true,
          dropdownItems: ['1', '2', '3', '4', '5', '6', '7', '8', '9'],
          dropdownItemLabels: {
            '1': 'الصف الأول',
            '2': 'الصف الثاني',
            '3': 'الصف الثالث',
            '4': 'الصف الرابع',
            '5': 'الصف الخامس',
            '6': 'الصف السادس',
            '7': 'الصف السابع',
            '8': 'الصف الثامن',
            '9': 'الصف التاسع',
          },
          initialDropdownValue: selectedGrade,
          onDropdownChanged: (value) => onGradeChanged(value!),
        ),
        SizedBox(height: 16),
        UniversalFormField(
          controller: addressController,
          hintText: 'العنوان بالتفصيل',
          prefixIcon: Icon(Icons.location_on, color: Color(0xFF7C3AED)),
          maxLines: 3,
          validator: (value) => value?.isEmpty ?? true ? 'مطلوب' : null,
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
