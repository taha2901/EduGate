import 'package:flutter/material.dart';

class EmployeeTypeSelector extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeChanged;

  const EmployeeTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نوع الوظيفة',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF7C3AED),
          ),
        ),
        SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            EmployeeTypeCard(
              icon: Icons.school,
              label: 'معلم',
              value: 'teacher',
              groupValue: selectedType,
              color: Color(0xFF7C3AED),
              onTap: () => onTypeChanged('teacher'),
            ),
            EmployeeTypeCard(
              icon: Icons.admin_panel_settings,
              label: 'إداري',
              value: 'admin',
              groupValue: selectedType,
              color: Colors.blue,
              onTap: () => onTypeChanged('admin'),
            ),
            EmployeeTypeCard(
              icon: Icons.cleaning_services,
              label: 'نظافة',
              value: 'cleaner',
              groupValue: selectedType,
              color: Colors.teal,
              onTap: () => onTypeChanged('cleaner'),
            ),
            EmployeeTypeCard(
              icon: Icons.directions_bus,
              label: 'سائق',
              value: 'driver',
              groupValue: selectedType,
              color: Colors.orange,
              onTap: () => onTypeChanged('driver'),
            ),
            EmployeeTypeCard(
              icon: Icons.security,
              label: 'أمن',
              value: 'security',
              groupValue: selectedType,
              color: Colors.red,
              onTap: () => onTypeChanged('security'),
            ),
            EmployeeTypeCard(
              icon: Icons.build,
              label: 'صيانة',
              value: 'maintenance',
              groupValue: selectedType,
              color: Colors.brown,
              onTap: () => onTypeChanged('maintenance'),
            ),
          ],
        ),
      ],
    );
  }
}

class EmployeeTypeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String groupValue;
  final Color color;
  final VoidCallback onTap;

  const EmployeeTypeCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 110,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.1) : Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? color : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  )
                ]
              : [],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? color : Colors.grey[600],
              size: 32,
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? color : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
