import 'package:edugate/core/helper/responsive_helper.dart';
import 'package:edugate/core/routings/routers.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ResponsiveHelper.value(
        context: context,
        mobile: 48.0,
        tablet: 52.0,
        desktop: 56.0,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF2563EB),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ResponsiveHelper.borderRadius(context, 12),
            ),
          ),
          elevation: 2,
        ),
        onPressed: () {
           Navigator.pushReplacementNamed(context, Routers.adminHome);
        },
        child: Text(
          'Sign In',
          style: TextStyle(
            fontSize: ResponsiveHelper.bodyLarge(context),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
