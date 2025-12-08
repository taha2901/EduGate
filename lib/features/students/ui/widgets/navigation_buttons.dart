import 'package:edugate/core/widgets/common/app_text_button.dart';
import 'package:flutter/material.dart';

class NavigationButtons extends StatelessWidget {
  final int currentStep;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const NavigationButtons({
    super.key,
    required this.currentStep,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (currentStep > 0)
            Expanded(
              child: AppTextButton(
                buttonText: 'السابق',
                icon: Icons.arrow_back,
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                ),
                backgroundColor: Colors.white,
                borderRadius: 12,
                onPressed: onPrevious,
              ),
            ),
          if (currentStep > 0) SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: AppTextButton(
              buttonText: currentStep < 2 ? 'التالي' : 'تسجيل الطالب',
              icon: currentStep < 2 ? Icons.arrow_forward : Icons.check,
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              backgroundColor: Color(0xFF7C3AED),
              borderRadius: 12,
              onPressed: onNext,
            ),
          ),
        ],
      ),
    );
  }
}
