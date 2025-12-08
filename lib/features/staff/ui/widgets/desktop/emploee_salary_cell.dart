import 'package:flutter/material.dart';

class EmployeeSalaryCell extends StatelessWidget {
  final double? salary;

  const EmployeeSalaryCell({super.key, required this.salary});

  @override
  Widget build(BuildContext context) {
    if (salary == null) {
      return Text('-', style: TextStyle(color: Colors.grey[400]));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.attach_money, size: 16, color: Colors.green),
        SizedBox(width: 4),
        Expanded(
          child: Text(
            '${salary!.toStringAsFixed(0)} ج.م',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.green[700],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
