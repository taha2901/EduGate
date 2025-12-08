import 'package:flutter/material.dart';

class ExpensesBreakdownWidget extends StatelessWidget {
  final double totalExpenses;

  const ExpensesBreakdownWidget({
    super.key,
    required this.totalExpenses,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.payments, color: Colors.red, size: 24),
              SizedBox(width: 12),
              Text(
                'تفاصيل المصروفات',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          ExpenseItem(label: 'رواتب الموظفين', amount: 85000, color: Colors.red),
          SizedBox(height: 12),
          ExpenseItem(label: 'فواتير (كهرباء، مياه، إنترنت)', amount: 15000, color: Colors.orange),
          SizedBox(height: 12),
          ExpenseItem(label: 'صيانة', amount: 12000, color: Colors.purple),
          SizedBox(height: 12),
          ExpenseItem(label: 'مستلزمات ومخزون', amount: 10000, color: Colors.blue),
          SizedBox(height: 12),
          ExpenseItem(label: 'أخرى', amount: 6000, color: Colors.grey),
        ],
      ),
    );
  }
}



class ExpenseItem extends StatelessWidget {
  final String label;
  final double amount;
  final Color color;

  const ExpenseItem({super.key, 
    required this.label,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 12),
        Expanded(child: Text(label, style: TextStyle(fontSize: 14))),
        Text(
          '${amount.toStringAsFixed(0)} ج.م',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
