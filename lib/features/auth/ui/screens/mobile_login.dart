import 'package:edugate/features/auth/ui/widgets/divider_widget.dart';
import 'package:edugate/features/auth/ui/widgets/login_form.dart';
import 'package:edugate/features/auth/ui/widgets/login_header.dart';
import 'package:edugate/features/auth/ui/widgets/social_login_button.dart';
import 'package:edugate/core/helper/responsive_helper.dart';
import 'package:edugate/features/auth/ui/widgets/footer_widget.dart';
import 'package:flutter/material.dart';

class MobileLogin extends StatelessWidget {
  const MobileLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: ResponsiveHelper.pagePadding(context),
          child: Center(
            child: Container(
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                  ),
                ],
              ),
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: ResponsiveHelper.spacing(context, 32)),
                    LoginHeader(),
                    SizedBox(height: ResponsiveHelper.spacing(context, 48)),
                    LoginForm(),
                    SizedBox(height: ResponsiveHelper.spacing(context, 32)),
                    DividerWidget(),
                    SizedBox(height: ResponsiveHelper.spacing(context, 16)),
                    SocialLoginButton(),
                    SizedBox(height: ResponsiveHelper.spacing(context, 32)),
                    FooterWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
