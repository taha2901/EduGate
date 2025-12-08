import 'package:flutter/material.dart';

class FinancialOverviewWidget extends StatelessWidget {
  final double totalIncome;
  final double totalExpenses;
  final double netProfit;

  const FinancialOverviewWidget({
    super.key,
    required this.totalIncome,
    required this.totalExpenses,
    required this.netProfit,
  });

  @override
  Widget build(BuildContext context) {
    final profitMargin = (netProfit / totalIncome * 100);

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF7C3AED), Color(0xFF6D28D9)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF7C3AED).withOpacity(0.3),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'نظرة عامة',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OverviewItem(
                  label: 'الإيرادات',
                  value: '${totalIncome.toStringAsFixed(0)} ج.م',
                  icon: Icons.trending_up,
                ),
              ),
              Container(width: 1, height: 50, color: Colors.white30),
              Expanded(
                child: OverviewItem(
                  label: 'المصروفات',
                  value: '${totalExpenses.toStringAsFixed(0)} ج.م',
                  icon: Icons.trending_down,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Divider(color: Colors.white30),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'صافي الربح',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${netProfit.toStringAsFixed(0)} ج.م',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.percent, color: Colors.white, size: 18),
                    SizedBox(width: 4),
                    Text(
                      '${profitMargin.toStringAsFixed(1)}%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class OverviewItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const OverviewItem({super.key, 
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 28),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.white70)),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
