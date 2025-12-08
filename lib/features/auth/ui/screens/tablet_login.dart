import 'package:edugate/features/auth/ui/widgets/divider_widget.dart';
import 'package:edugate/features/auth/ui/widgets/footer_widget.dart';
import 'package:edugate/features/auth/ui/widgets/tablet/header_section.dart';
import 'package:flutter/material.dart';
import 'package:edugate/features/auth/ui/widgets/login_form.dart';
import 'package:edugate/features/auth/ui/widgets/social_login_button.dart';

class TabletLogin extends StatelessWidget {
  const TabletLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF9FAFB),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 500,
              padding: EdgeInsets.all(40),
              margin: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeaderSection(),
                  SizedBox(height: 40),
                  LoginForm(),
                  SizedBox(height: 32),
                  DividerWidget(),
                  SizedBox(height: 24),
                  SocialLoginButton(),
                  SizedBox(height: 24),
                  FooterWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


