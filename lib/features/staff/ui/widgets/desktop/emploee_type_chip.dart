import 'package:edugate/features/staff/ui/widgets/desktop/employee_helpers.dart';
import 'package:flutter/material.dart';

class EmployeeTypeChip extends StatelessWidget {
  final String employeeType;

  const EmployeeTypeChip({super.key, required this.employeeType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: EmployeeHelpers.getEmployeeTypeColor(employeeType)
            .withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        EmployeeHelpers.getEmployeeTypeLabel(employeeType),
        style: TextStyle(
          fontSize: 12,
          color: EmployeeHelpers.getEmployeeTypeColor(employeeType),
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
