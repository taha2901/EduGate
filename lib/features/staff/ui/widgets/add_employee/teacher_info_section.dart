import 'package:edugate/core/widgets/common/app_text_form_field.dart';
import 'package:flutter/material.dart';

class TeacherInfoSection extends StatelessWidget {
  final String? selectedDepartment;
  final List<String> selectedSubjects;
  final Function(String?) onDepartmentChanged;
  final Function(String) onSubjectToggle;

  const TeacherInfoSection({
    super.key,
    required this.selectedDepartment,
    required this.selectedSubjects,
    required this.onDepartmentChanged,
    required this.onSubjectToggle,
  });

  @override
  Widget build(BuildContext context) {
    final departments = [
      'رياضيات',
      'علوم',
      'لغة عربية',
      'لغة إنجليزية',
      'تاريخ',
      'جغرافيا',
      'تربية إسلامية',
      'تربية بدنية',
    ];

    final subjects = [
      'جبر',
      'هندسة',
      'حساب',
      'فيزياء',
      'كيمياء',
      'نحو',
      'أدب',
      'بلاغة',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('بيانات المعلم', Icons.school),
        SizedBox(height: 16),
        UniversalFormField(
          hintText: 'القسم/التخصص',
          prefixIcon: Icon(Icons.category, color: Color(0xFF7C3AED)),
          hasDropdown: true,
          dropdownItems: departments,
          initialDropdownValue: selectedDepartment,
          onDropdownChanged: onDepartmentChanged,
          validator: (value) => value == null ? 'اختر القسم' : null,
        ),
        SizedBox(height: 16),
        Text(
          'المواد التي يدرسها',
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: subjects
              .map((subject) => _buildSubjectChip(subject))
              .toList(),
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

  Widget _buildSubjectChip(String subject) {
    final isSelected = selectedSubjects.contains(subject);

    return FilterChip(
      label: Text(subject),
      selected: isSelected,
      onSelected: (selected) => onSubjectToggle(subject),
      selectedColor: Color(0xFF7C3AED),
      checkmarkColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
