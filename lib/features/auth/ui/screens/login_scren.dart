import 'package:edugate/core/helper/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'mobile_login.dart';
import 'tablet_login.dart';
import 'desktop_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (ResponsiveHelper.isDesktop(context)) {
          return DesktopLogin();
        } else if (ResponsiveHelper.isTablet(context)) {
          return TabletLogin();
        } else {
          return MobileLogin();
        }
      },
    );
  }
}
