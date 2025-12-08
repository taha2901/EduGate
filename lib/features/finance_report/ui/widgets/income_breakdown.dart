import 'package:flutter/material.dart';

class IncomeBreakdownWidget extends StatelessWidget {
  final double totalIncome;

  const IncomeBreakdownWidget({
    super.key,
    required this.totalIncome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
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
              Icon(Icons.account_balance_wallet, color: Colors.green, size: 24),
              SizedBox(width: 12),
              Text(
                'تفاصيل الإيرادات',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          RevenueItem(
            label: 'المصروفات الدراسية',
            amount: 220000,
            percentage: 89.8,
            color: Colors.blue,
          ),
          SizedBox(height: 12),
          RevenueItem(
            label: 'رسوم النقل',
            amount: 20000,
            percentage: 8.2,
            color: Colors.orange,
          ),
          SizedBox(height: 12),
          RevenueItem(
            label: 'الزي المدرسي',
            amount: 5000,
            percentage: 2.0,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}


class RevenueItem extends StatelessWidget {
  final String label;
  final double amount;
  final double percentage;
  final Color color;

  const RevenueItem({super.key, 
    required this.label,
    required this.amount,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(fontSize: 14)),
            Text(
              '${amount.toStringAsFixed(0)} ج.م',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: percentage / 100,
                  minHeight: 8,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
            ),
            SizedBox(width: 8),
            Text(
              '${percentage.toStringAsFixed(1)}%',
              style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
