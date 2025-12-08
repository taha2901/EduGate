import 'package:edugate/core/helper/responsive_helper.dart';
import 'package:edugate/features/students/ui/desktop_students.dart';
import 'package:edugate/features/students/ui/mobile_students.dart';
import 'package:edugate/features/students/ui/tablet_students.dart';
import 'package:flutter/material.dart';


class StudentsManagementScreen extends StatelessWidget {
  const StudentsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (ResponsiveHelper.isDesktop(context)) {
          return DesktopStudentsManagementScreen();
        } else if (ResponsiveHelper.isTablet(context)) {
          return TabletStudentsManagementScreen();
        } else {
          return MobileStudentsManagementScreen();
        }
      },
    );
  }
}
