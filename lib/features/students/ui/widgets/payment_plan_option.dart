import 'package:flutter/material.dart';

class PaymentPlanSelector extends StatelessWidget {
  final String selectedPlan;
  final Function(String) onPlanChanged;

  const PaymentPlanSelector({
    super.key,
    required this.selectedPlan,
    required this.onPlanChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentPlanOption(
          title: 'دفع كامل',
          subtitle: 'دفعة واحدة بخصم 5%',
          icon: Icons.payments,
          value: 'full',
          groupValue: selectedPlan,
          onChanged: (value) => onPlanChanged(value!),
        ),
        SizedBox(height: 12),
        PaymentPlanOption(
          title: 'قسطين',
          subtitle: 'دفعتين متساويتين (بداية كل ترم)',
          icon: Icons.calendar_view_week,
          value: 'two',
          groupValue: selectedPlan,
          onChanged: (value) => onPlanChanged(value!),
        ),
        SizedBox(height: 12),
        PaymentPlanOption(
          title: 'أقساط شهرية',
          subtitle: '10 أقساط شهرية متساوية',
          icon: Icons.calendar_month,
          value: 'monthly',
          groupValue: selectedPlan,
          onChanged: (value) => onPlanChanged(value!),
        ),
      ],
    );
  }
}

class PaymentPlanOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String value;
  final String groupValue;
  final Function(String?) onChanged;

  const PaymentPlanOption({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? Color(0xFF7C3AED) : Colors.grey[300]!,
          width: isSelected ? 2 : 1,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Color(0xFF7C3AED).withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 2,
                )
              ]
            : null,
      ),
      child: RadioListTile<String>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: Color(0xFF7C3AED),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        secondary: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected 
                ? Color(0xFF7C3AED).withOpacity(0.1) 
                : Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: isSelected ? Color(0xFF7C3AED) : Colors.grey[600],
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: isSelected ? Color(0xFF7C3AED) : Colors.black87,
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 4),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
