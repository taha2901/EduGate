import 'package:flutter/material.dart';

class StaffHeader extends StatelessWidget {
  final int totalEmployees;
  final VoidCallback onAddEmployee;
  final VoidCallback onBack;

  const StaffHeader({
    super.key,
    required this.totalEmployees,
    required this.onAddEmployee,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.people, size: 40, color: Color(0xFF7C3AED)),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'إدارة الموظفين',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                'إدارة شاملة لجميع موظفي المدرسة ($totalEmployees موظف)',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        ElevatedButton.icon(
          onPressed: onAddEmployee,
          icon: Icon(Icons.person_add),
          label: Text('إضافة موظف جديد'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF7C3AED),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        SizedBox(width: 16),
        IconButton(
          onPressed: onBack,
          icon: Icon(Icons.arrow_forward_ios_outlined, size: 28),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            padding: EdgeInsets.all(12),
            elevation: 1,
          ),
        ),
      ],
    );
  }
}
