import 'package:edugate/features/staff_attend/data/teacher_management_model.dart';
import 'package:edugate/features/staff/ui/widgets/desktop/employee_helpers.dart';
import 'package:flutter/material.dart';

class EmployeeInfoCell extends StatelessWidget {
  final EmployeeModel employee;

  const EmployeeInfoCell({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: EmployeeHelpers.getEmployeeTypeColor(
            employee.employeeType,
          ).withOpacity(0.1),
          child: Icon(
            EmployeeHelpers.getEmployeeTypeIcon(employee.employeeType),
            color: EmployeeHelpers.getEmployeeTypeColor(employee.employeeType),
            size: 22,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                employee.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2),
              Text(
                employee.phone,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
