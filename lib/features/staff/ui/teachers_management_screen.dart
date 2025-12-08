import 'package:edugate/core/helper/responsive_helper.dart';
import 'package:edugate/features/staff/ui/desktop_teachers.dart';
import 'package:edugate/features/staff/ui/mobile_teachers.dart';
import 'package:edugate/features/staff/ui/tablet_teachers.dart';
import 'package:flutter/material.dart';

class  TeachersManagementScreen extends StatelessWidget {
  const  TeachersManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
      builder: (context, constraints) {
        if (ResponsiveHelper.isDesktop(context)) {
          return DesktopStaffManagementScreen();
        } else if (ResponsiveHelper.isTablet(context)) {
          return  TabletStaffManagementScreen ();
        } else {
          return MobileStaffManagementScreen();
        }
      },
    );
  }
}