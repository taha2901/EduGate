import 'package:edugate/core/widgets/common/app_text_form_field.dart';
import 'package:flutter/material.dart';

class AdditionalInfoSection extends StatelessWidget {
  final TextEditingController nationalIdController;
  final TextEditingController addressController;

  const AdditionalInfoSection({
    super.key,
    required this.nationalIdController,
    required this.addressController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('معلومات إضافية', Icons.info_outline),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: UniversalFormField(
                controller: nationalIdController,
                hintText: 'رقم الهوية الوطنية',
                prefixIcon: Icon(Icons.credit_card, color: Color(0xFF7C3AED)),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: UniversalFormField(
                controller: addressController,
                hintText: 'العنوان',
                prefixIcon: Icon(Icons.home, color: Color(0xFF7C3AED)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Color(0xFF7C3AED), size: 20),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF7C3AED),
          ),
        ),
      ],
    );
  }
}