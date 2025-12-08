import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;

  const StepIndicator({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          StepItem(
            number: 1,
            label: 'بيانات الطالب',
            isActive: currentStep == 0,
            isCompleted: currentStep > 0,
          ),
          Expanded(child: Divider(thickness: 2)),
          StepItem(
            number: 2,
            label: 'بيانات ولي الأمر',
            isActive: currentStep == 1,
            isCompleted: currentStep > 1,
          ),
          Expanded(child: Divider(thickness: 2)),
          StepItem(
            number: 3,
            label: 'المصروفات',
            isActive: currentStep == 2,
            isCompleted: false,
          ),
        ],
      ),
    );
  }
}

class StepItem extends StatelessWidget {
  final int number;
  final String label;
  final bool isActive;
  final bool isCompleted;

  const StepItem({
    super.key,
    required this.number,
    required this.label,
    required this.isActive,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _getStepColor(),
            shape: BoxShape.circle,
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: Color(0xFF7C3AED).withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 2,
                    )
                  ]
                : null,
          ),
          child: Center(
            child: isCompleted
                ? Icon(Icons.check, color: Colors.white, size: 20)
                : Text(
                    '$number',
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Color(0xFF7C3AED) : Colors.grey[600],
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Color _getStepColor() {
    if (isCompleted) return Colors.green;
    if (isActive) return Color(0xFF7C3AED);
    return Colors.grey[300]!;
  }
}
