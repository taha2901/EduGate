import 'package:edugate/features/dashboard/ui/widgets/desktop/financial_card.dart';
import 'package:flutter/material.dart';

class FinancialOverview extends StatelessWidget {
  const FinancialOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet,
                color: Color(0xFF7C3AED),
                size: 28,
              ),
              SizedBox(width: 12),
              Text(
                'الوضع المالي - الشهر الحالي',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: FinancialCard(
                  label: 'الإيرادات',
                  value: '245,000 ج.م',
                  icon: Icons.trending_up,
                  color: Colors.green,
                  percentage: '+12.5%',
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: FinancialCard(
                  label: 'المصروفات',
                  value: '128,000 ج.م',
                  icon: Icons.trending_down,
                  color: Colors.orange,
                  percentage: '+5.2%',
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: FinancialCard(
                  label: 'صافي الربح',
                  value: '117,000 ج.م',
                  icon: Icons.attach_money,
                  color: Colors.blue,
                  percentage: '+18.3%',
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: FinancialCard(
                  label: 'المتأخرات',
                  value: '68,000 ج.م',
                  icon: Icons.warning,
                  color: Colors.red,
                  percentage: '28 طالب',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
