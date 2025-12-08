import 'package:edugate/features/staff_attend/data/teacher_management_model.dart';
import 'package:flutter/material.dart';

class StaffStatsCards extends StatelessWidget {
  final List<EmployeeModel> employees;

  const StaffStatsCards({
    super.key,
    required this.employees,
  });

  @override
  Widget build(BuildContext context) {
    final totalEmployees = employees.length;
    final teachers = employees.where((e) => e.employeeType == 'teacher').length;
    final staff = employees.where((e) => e.employeeType != 'teacher').length;
    final activeEmployees = employees.where((e) => e.status == 'active').length;

    return Row(
      children: [
        Expanded(
          child: StatCard(
            icon: Icons.people,
            label: 'إجمالي الموظفين',
            value: '$totalEmployees',
            color: Colors.blue,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: StatCard(
            icon: Icons.school,
            label: 'المعلمين',
            value: '$teachers',
            color: Colors.purple,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: StatCard(
            icon: Icons.work,
            label: 'الموظفين الإداريين',
            value: '$staff',
            color: Colors.orange,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: StatCard(
            icon: Icons.check_circle,
            label: 'نشط',
            value: '$activeEmployees',
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const StatCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
