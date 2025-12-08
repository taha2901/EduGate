import 'package:edugate/core/helper/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'mobile_dashboard.dart';
import 'tablet_dashboard.dart';
import 'desktop_dashboard.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (ResponsiveHelper.isDesktop(context)) {
          return DesktopAdminDashboard();
        } else if (ResponsiveHelper.isTablet(context)) {
          return TabletAdminDashboard();
        } else {
          return MobileAdminDashboard();
        }
      },
    );
  }
}
