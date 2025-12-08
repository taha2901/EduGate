// features/admin/ui/screens/students/widgets/financial_summary.dart
import 'package:flutter/material.dart';

class FinancialSummary extends StatelessWidget {
  final double tuition;
  final double discount;
  final double transportFee;
  final bool needsTransportation;

  const FinancialSummary({
    Key? key,
    required this.tuition,
    required this.discount,
    required this.transportFee,
    required this.needsTransportation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final total = tuition - discount + transportFee;

    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF7C3AED), Color(0xFF6D28D9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF7C3AED).withOpacity(0.3),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.receipt_long, color: Colors.white, size: 28),
              SizedBox(width: 12),
              Text(
                'ملخص المصروفات',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          SummaryRow(
            label: 'المصروفات الأساسية',
            value: tuition,
            icon: Icons.school,
          ),
          SizedBox(height: 12),
          SummaryRow(
            label: 'الخصم',
            value: -discount,
            icon: Icons.discount,
            isDiscount: true,
          ),
          if (needsTransportation) ...[
            SizedBox(height: 12),
            SummaryRow(
              label: 'رسوم النقل',
              value: transportFee,
              icon: Icons.directions_bus,
            ),
          ],
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: Colors.white30, thickness: 1.5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.account_balance_wallet, color: Colors.white, size: 24),
                  SizedBox(width: 8),
                  Text(
                    'الإجمالي',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                '${total.toStringAsFixed(0)} ج.م',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final double value;
  final IconData icon;
  final bool isDiscount;

  const SummaryRow({
    Key? key,
    required this.label,
    required this.value,
    required this.icon,
    this.isDiscount = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.white70, size: 20),
            SizedBox(width: 8),
            Text(
              '$label:',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        Text(
          '${isDiscount ? "" : ""}${value.toStringAsFixed(0)} ج.م',
          style: TextStyle(
            fontSize: 17,
            color: isDiscount ? Colors.greenAccent : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
