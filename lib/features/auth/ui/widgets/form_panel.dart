import 'package:edugate/features/auth/ui/widgets/divider_widget.dart';
import 'package:edugate/features/auth/ui/widgets/login_form.dart';
import 'package:edugate/features/auth/ui/widgets/social_login_button.dart';
import 'package:flutter/material.dart';

class FormPanel extends StatelessWidget {
  const FormPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF9FAFB),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 480,
            padding: EdgeInsets.all(48),
            margin: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 40,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sign in to your account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Welcome back! Please enter your details.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 40),
                LoginForm(),
                SizedBox(height: 32),
                DividerWidget(),
                SizedBox(height: 24),
                SocialLoginButton(),
                SizedBox(height: 24),
                Center(
                  child: Text(
                    'Need help? Contact support',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
