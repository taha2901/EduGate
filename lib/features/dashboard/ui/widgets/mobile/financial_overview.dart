import 'package:flutter/material.dart';

class FinancialOverviewMobile extends StatelessWidget {
  const FinancialOverviewMobile ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF7C3AED), Color(0xFF6D28D9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الإيرادات الشهرية',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'ديسمبر 2025',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            '245,000 ج.م',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.trending_up, color: Colors.greenAccent, size: 20),
              SizedBox(width: 4),
              Text(
                '+12.5% من الشهر الماضي',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Divider(color: Colors.white30, thickness: 1),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FinancialItem(
                icon: Icons.account_balance_wallet,
                label: 'المصروفات',
                value: '128,000 ج.م',
              ),
              Container(width: 1, height: 40, color: Colors.white30),
              FinancialItem(
                icon: Icons.trending_up,
                label: 'صافي الربح',
                value: '117,000 ج.م',
                isProfit: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FinancialItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isProfit;

  const FinancialItem({super.key, 
    required this.icon,
    required this.label,
    required this.value,
    this.isProfit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white70, size: 18),
              SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ],
          ),
          SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isProfit ? Colors.greenAccent : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
