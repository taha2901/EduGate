import 'package:edugate/features/staff_attend/data/teacher_management_model.dart';
import 'package:flutter/material.dart';

class StaffTypeFilter extends StatelessWidget {
  final List<EmployeeModel> employees;
  final String selectedType;
  final Function(String) onTypeChanged;

  const StaffTypeFilter({
    super.key,
    required this.employees,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.filter_list, color: Color(0xFF7C3AED), size: 20),
              SizedBox(width: 8),
              Text(
                'تصفية حسب الوظيفة',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16),

        
          Row(
            children: [
              Expanded(
                child: TypeChip(
                  icon: Icons.apps,
                  label: 'الكل',
                  value: 'all',
                  count: employees.length,
                  groupValue: selectedType,
                  color: Colors.grey,
                  onTap: () => onTypeChanged('all'),
                ),
              ),
              Expanded(
                child: TypeChip(
                  icon: Icons.school,
                  label: 'معلمين',
                  value: 'teacher',
                  count: employees
                      .where((e) => e.employeeType == 'teacher')
                      .length,
                  groupValue: selectedType,
                  color: Colors.purple,
                  onTap: () => onTypeChanged('teacher'),
                ),
              ),
              Expanded(
                child: TypeChip(
                  icon: Icons.admin_panel_settings,
                  label: 'إداريين',
                  value: 'admin',
                  count: employees
                      .where((e) => e.employeeType == 'admin')
                      .length,
                  groupValue: selectedType,
                  color: Colors.blue,
                  onTap: () => onTypeChanged('admin'),
                ),
              ),
              Expanded(
                child: TypeChip(
                  icon: Icons.cleaning_services,
                  label: 'نظافة',
                  value: 'cleaner',
                  count: employees
                      .where((e) => e.employeeType == 'cleaner')
                      .length,
                  groupValue: selectedType,
                  color: Colors.teal,
                  onTap: () => onTypeChanged('cleaner'),
                ),
              ),
              Expanded(
                child: TypeChip(
                  icon: Icons.directions_bus,
                  label: 'سائقين',
                  value: 'driver',
                  count: employees
                      .where((e) => e.employeeType == 'driver')
                      .length,
                  groupValue: selectedType,
                  color: Colors.orange,
                  onTap: () => onTypeChanged('driver'),
                ),
              ),
              Expanded(
                child: TypeChip(
                  icon: Icons.security,
                  label: 'أمن',
                  value: 'security',
                  count: employees
                      .where((e) => e.employeeType == 'security')
                      .length,
                  groupValue: selectedType,
                  color: Colors.red,
                  onTap: () => onTypeChanged('security'),
                ),
              ),
              Expanded(
                child: TypeChip(
                  icon: Icons.build,
                  label: 'صيانة',
                  value: 'maintenance',
                  count: employees
                      .where((e) => e.employeeType == 'maintenance')
                      .length,
                  groupValue: selectedType,
                  color: Colors.brown,
                  onTap: () => onTypeChanged('maintenance'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TypeChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final int count;
  final String groupValue;
  final Color color;
  final VoidCallback onTap;

  const TypeChip({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.count,
    required this.groupValue,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.1) : Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? color : Colors.grey[300]!,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? color : Colors.grey[600],
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? color : Colors.grey[700],
                ),
              ),
              SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: isSelected ? color : Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
