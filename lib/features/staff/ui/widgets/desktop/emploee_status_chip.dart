import 'package:edugate/features/staff/ui/widgets/desktop/employee_helpers.dart';
import 'package:flutter/material.dart';

class EmployeeStatusChip extends StatelessWidget {
  final String status;

  const EmployeeStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: EmployeeHelpers.getStatusColor(status).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: EmployeeHelpers.getStatusColor(status),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 6),
          Text(
            EmployeeHelpers.getStatusText(status),
            style: TextStyle(
              fontSize: 12,
              color: EmployeeHelpers.getStatusColor(status),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
