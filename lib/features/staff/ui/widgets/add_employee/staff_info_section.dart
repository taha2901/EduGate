import 'package:edugate/core/widgets/common/app_text_form_field.dart';
import 'package:flutter/material.dart';

class StaffInfoSection extends StatelessWidget {
  final String employeeType;
  final String? selectedPosition;
  final String? selectedShift;
  final Function(String?) onPositionChanged;
  final Function(String?) onShiftChanged;

  const StaffInfoSection({
    super.key,
    required this.employeeType,
    required this.selectedPosition,
    required this.selectedShift,
    required this.onPositionChanged,
    required this.onShiftChanged,
  });

  @override
  Widget build(BuildContext context) {
    final positions = {
      'admin': ['مدير إداري', 'سكرتيرة', 'محاسب', 'أمين مكتبة'],
      'cleaner': ['عامل نظافة', 'مشرف نظافة'],
      'driver': ['سائق باص', 'مشرف نقل'],
      'security': ['حارس أمن', 'مشرف أمن'],
      'maintenance': ['فني صيانة', 'كهربائي', 'سباك', 'نجار'],
    };

    final shifts = ['صباحي', 'مسائي', 'مناوبة'];
    final shiftLabels = {
      'صباحي': 'صباحي (7 ص - 3 م)',
      'مسائي': 'مسائي (3 م - 11 م)',
      'مناوبة': 'مناوبة (24 ساعة)',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('بيانات الوظيفة', Icons.work),
        SizedBox(height: 16),
        UniversalFormField(
          hintText: 'المنصب',
          prefixIcon: Icon(Icons.work, color: Color(0xFF7C3AED)),
          hasDropdown: true,
          dropdownItems: positions[employeeType] ?? [],
          initialDropdownValue: selectedPosition,
          onDropdownChanged: onPositionChanged,
          validator: (value) => value == null ? 'اختر المنصب' : null,
        ),
        SizedBox(height: 16),
        UniversalFormField(
          hintText: 'الوردية',
          prefixIcon: Icon(Icons.schedule, color: Color(0xFF7C3AED)),
          hasDropdown: true,
          dropdownItems: shifts,
          dropdownItemLabels: shiftLabels,
          initialDropdownValue: selectedShift,
          onDropdownChanged: onShiftChanged,
          validator: (value) => value == null ? 'اختر الوردية' : null,
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
