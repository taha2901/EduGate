import 'package:edugate/core/widgets/common/app_text_button.dart';
import 'package:flutter/material.dart';

class PaymentStatusWidget extends StatelessWidget {
  final int paidStudents;
  final int pendingPayments;
  final double pendingAmount;

  const PaymentStatusWidget({
    super.key,
    required this.paidStudents,
    required this.pendingPayments,
    required this.pendingAmount,
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
              Icon(Icons.receipt_long, color: Color(0xFF7C3AED), size: 24),
              SizedBox(width: 12),
              Text(
                'حالة المدفوعات',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: PaymentStatusCard(
                  icon: Icons.check_circle,
                  label: 'تم السداد',
                  value: '$paidStudents',
                  color: Colors.green,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: PaymentStatusCard(
                  icon: Icons.pending,
                  label: 'متأخرات',
                  value: '$pendingPayments',
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.orange.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.warning, color: Colors.orange),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'إجمالي المتأخرات',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      Text(
                        '${pendingAmount.toStringAsFixed(0)} ج.م',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                AppTextButton(
                  buttonText: 'المتابعة',
                  textStyle: TextStyle(fontSize: 14, color: Colors.white),
                  backgroundColor: Colors.orange,
                  buttonHeight: 40,
                  buttonWidth: 100,
                  borderRadius: 8,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentStatusCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const PaymentStatusCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }
}
