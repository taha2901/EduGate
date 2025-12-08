// features/admin/staff/ui/widgets/mobile/mobile_staff_stats_row.dart
import 'package:edugate/features/staff_attend/data/teacher_management_model.dart';
import 'package:flutter/material.dart';

class MobileStaffStatsRow extends StatelessWidget {
  final List<EmployeeModel> employees;

  const MobileStaffStatsRow({
    Key? key,
    required this.employees,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final total = employees.length;
    final teachers =
        employees.where((e) => e.employeeType == 'teacher').length;
    final staff = employees.where((e) => e.employeeType != 'teacher').length;
    final active = employees.where((e) => e.status == 'active').length;

    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MobileStatItem(
            label: 'إجمالي',
            value: '$total',
            color: Colors.blue,
            icon: Icons.people,
          ),
          MobileStatItem(
            label: 'معلمين',
            value: '$teachers',
            color: Colors.purple,
            icon: Icons.school,
          ),
          MobileStatItem(
            label: 'موظفين',
            value: '$staff',
            color: Colors.orange,
            icon: Icons.work,
          ),
          MobileStatItem(
            label: 'نشط',
            value: '$active',
            color: Colors.green,
            icon: Icons.check_circle,
          ),
        ],
      ),
    );
  }
}

class MobileStatItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData icon;

  const MobileStatItem({
    Key? key,
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
