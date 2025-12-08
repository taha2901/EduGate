import 'package:edugate/core/helper/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'mobile_announcements.dart';
import 'tablet_announcements.dart';
import 'desktop_announcements.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (ResponsiveHelper.isDesktop(context)) {
          return DesktopAnnouncementsScreen();
        } else if (ResponsiveHelper.isTablet(context)) {
          return TabletAnnouncementsScreen();
        } else {
          return MobileAnnouncementsScreen();
        }
      },
    );
  }
}
