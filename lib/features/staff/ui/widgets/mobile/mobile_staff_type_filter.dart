// features/admin/staff/ui/widgets/mobile/mobile_staff_type_filter.dart
import 'package:edugate/features/staff_attend/data/teacher_management_model.dart';
import 'package:flutter/material.dart';

class MobileStaffTypeFilter extends StatelessWidget {
  final List<EmployeeModel> employees;
  final String selectedType;
  final Function(String) onTypeChanged;

  const MobileStaffTypeFilter({
    Key? key,
    required this.employees,
    required this.selectedType,
    required this.onTypeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final types = [
      {
        'value': 'all',
        'label': 'الكل',
        'icon': Icons.apps,
        'color': Colors.grey,
        'count': employees.length,
      },
      {
        'value': 'teacher',
        'label': 'معلمين',
        'icon': Icons.school,
        'color': Colors.purple,
        'count': employees.where((e) => e.employeeType == 'teacher').length,
      },
      {
        'value': 'admin',
        'label': 'إداريين',
        'icon': Icons.admin_panel_settings,
        'color': Colors.blue,
        'count': employees.where((e) => e.employeeType == 'admin').length,
      },
      {
        'value': 'cleaner',
        'label': 'نظافة',
        'icon': Icons.cleaning_services,
        'color': Colors.teal,
        'count': employees.where((e) => e.employeeType == 'cleaner').length,
      },
      {
        'value': 'driver',
        'label': 'سائقين',
        'icon': Icons.directions_bus,
        'color': Colors.orange,
        'count': employees.where((e) => e.employeeType == 'driver').length,
      },
    ];

    return Container(
      height: 64,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: types.length,
        itemBuilder: (context, index) {
          final type = types[index];
          final isSelected = type['value'] == selectedType;

          return GestureDetector(
            onTap: () => onTypeChanged(type['value'] as String),
            child: Container(
              margin: EdgeInsets.only(left: 8),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? (type['color'] as Color).withOpacity(0.1)
                    : Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? (type['color'] as Color)
                      : Colors.grey[300]!,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    type['icon'] as IconData,
                    size: 18,
                    color: isSelected
                        ? (type['color'] as Color)
                        : Colors.grey[600],
                  ),
                  SizedBox(width: 6),
                  Text(
                    type['label'] as String,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected
                          ? (type['color'] as Color)
                          : Colors.grey[700],
                    ),
                  ),
                  if (type['count'] as int > 0) ...[
                    SizedBox(width: 6),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? (type['color'] as Color)
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${type['count']}',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
