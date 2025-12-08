import 'package:edugate/core/widgets/common/app_text_form_field.dart';
import 'package:edugate/features/students/ui/widgets/financial_summary.dart';
import 'package:edugate/features/students/ui/widgets/payment_plan_option.dart';
import 'package:flutter/material.dart';

class FinancialInfoStep extends StatelessWidget {
  final TextEditingController tuitionController;
  final TextEditingController discountController;
  final TextEditingController transportFeeController;
  final String paymentPlan;
  final bool needsTransportation;
  final Function(String) onPaymentPlanChanged;
  final Function(bool) onTransportationChanged;

  const FinancialInfoStep({
    super.key,
    required this.tuitionController,
    required this.discountController,
    required this.transportFeeController,
    required this.paymentPlan,
    required this.needsTransportation,
    required this.onPaymentPlanChanged,
    required this.onTransportationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('المصروفات الدراسية'),
        SizedBox(height: 16),
        UniversalFormField(
          controller: tuitionController,
          hintText: 'المصروفات الدراسية',
          prefixIcon: Icon(Icons.payment, color: Color(0xFF7C3AED)),
          suffixText: 'ج.م',
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value?.isEmpty ?? true) return 'مطلوب';
            if (double.tryParse(value!) == null) return 'أدخل رقم صحيح';
            return null;
          },
        ),
        SizedBox(height: 16),
        UniversalFormField(
          controller: discountController,
          hintText: 'الخصم (إن وجد)',
          prefixIcon: Icon(Icons.discount, color: Color(0xFF7C3AED)),
          suffixText: 'ج.م',
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16),
        TransportationSwitch(
          value: needsTransportation,
          onChanged: onTransportationChanged,
        ),
        if (needsTransportation) ...[
          SizedBox(height: 16),
          UniversalFormField(
            controller: transportFeeController,
            hintText: 'رسوم النقل الشهري',
            prefixIcon: Icon(Icons.directions_bus, color: Color(0xFF7C3AED)),
            suffixText: 'ج.م',
            keyboardType: TextInputType.number,
          ),
        ],
        SizedBox(height: 32),
        _buildSectionTitle('خطة السداد'),
        SizedBox(height: 16),
        PaymentPlanSelector(
          selectedPlan: paymentPlan,
          onPlanChanged: onPaymentPlanChanged,
        ),
        SizedBox(height: 32),
        FinancialSummary(
          tuition: double.tryParse(tuitionController.text) ?? 0,
          discount: double.tryParse(discountController.text) ?? 0,
          transportFee: needsTransportation 
              ? (double.tryParse(transportFeeController.text) ?? 0) 
              : 0,
          needsTransportation: needsTransportation,
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: Color(0xFF7C3AED),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF7C3AED),
          ),
        ),
      ],
    );
  }
}

class TransportationSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  const TransportationSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: SwitchListTile(
        title: Text(
          'يحتاج مواصلات',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          'رسوم النقل الشهري',
          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
        ),
        value: value,
        onChanged: onChanged,
        activeColor: Color(0xFF7C3AED),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
