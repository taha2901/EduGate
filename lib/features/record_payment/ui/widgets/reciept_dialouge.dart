import 'package:flutter/material.dart';

class ReceiptDialog extends StatelessWidget {
  final String studentName;
  final String amount;
  final String paymentType;
  final String paymentMethod;

  const ReceiptDialog({super.key, 
    required this.studentName,
    required this.amount,
    required this.paymentType,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final receiptNumber =
        'REC${now.year}${now.month}${now.day}${now.hour}${now.minute}';

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        constraints: BoxConstraints(maxWidth: 400),
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 64),
            SizedBox(height: 16),
            Text(
              'تم التسجيل بنجاح',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ReceiptRow(label: 'رقم الإيصال', value: receiptNumber),
                  Divider(height: 20),
                  ReceiptRow(label: 'الطالب', value: studentName),
                  Divider(height: 20),
                  ReceiptRow(label: 'نوع الدفعة', value: paymentType),
                  Divider(height: 20),
                  ReceiptRow(label: 'طريقة الدفع', value: paymentMethod),
                  Divider(height: 20),
                  ReceiptRow(
                    label: 'المبلغ',
                    value: '$amount ج.م',
                    valueColor: Colors.green,
                    valueBold: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Print receipt
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('جاري طباعة الإيصال...')),
                      );
                    },
                    icon: Icon(Icons.print),
                    label: Text('طباعة'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Color(0xFF7C3AED),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text('تم'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7C3AED),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class ReceiptRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final bool valueBold;

  const ReceiptRow({super.key, 
    required this.label,
    required this.value,
    this.valueColor,
    this.valueBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: valueBold ? FontWeight.bold : FontWeight.normal,
            color: valueColor ?? Colors.black87,
          ),
        ),
      ],
    );
  }
}
