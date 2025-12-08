// admin_bottom_nav_bar.dart
import 'package:edugate/core/helper/responsive_helper.dart';
import 'package:edugate/features/announcements/ui/announcements_screen.dart';
import 'package:edugate/features/dashboard/ui/desktop_dashboard.dart';
import 'package:edugate/features/dashboard/ui/mobile_dashboard.dart';
import 'package:edugate/features/students/ui/students_management_screen.dart';
import 'package:edugate/features/staff/ui/teachers_management_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class AdminBottomNavBar extends StatefulWidget {
  const AdminBottomNavBar({super.key});

  @override
  State<AdminBottomNavBar> createState() => _AdminBottomNavBarState();
}

class _AdminBottomNavBarState extends State<AdminBottomNavBar> {
  late final PersistentTabController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
  }

  List<Widget> _buildScreens() {
    return [
      MobileAdminDashboard(),
      TeachersManagementScreen(),
      StudentsManagementScreen(),
      AnnouncementsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    final theme = Theme.of(context);
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.dashboard),
        title: 'الرئيسية',
        activeColorPrimary: const Color(0xFF7C3AED),
        inactiveColorPrimary: theme.disabledColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.people),
        title: 'المدرسين',
        activeColorPrimary: const Color(0xFF7C3AED),
        inactiveColorPrimary: theme.disabledColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.bar_chart),
        title: 'الطللاب',
        activeColorPrimary: const Color(0xFF7C3AED),
        inactiveColorPrimary: theme.disabledColor,
      ),

      PersistentBottomNavBarItem(
        icon: const Icon(Icons.campaign),
        title: 'الإعلانات',
        activeColorPrimary: const Color(0xFF7C3AED),
        inactiveColorPrimary: theme.disabledColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // ✅ إذا Desktop → Desktop Dashboard
    if (ResponsiveHelper.isDesktop(context)) {
      return DesktopAdminDashboard();
    }

    // ✅ إذا Mobile/Tablet → Bottom Nav Bar
    final theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        onItemSelected: (value) {
          setState(() {
            currentIndex = value;
            debugPrint('Admin Current Index is $currentIndex');
          });
        },
        items: _navBarsItems(context),
        navBarStyle: NavBarStyle.style9,
        backgroundColor:
            theme.bottomNavigationBarTheme.backgroundColor ??
            theme.colorScheme.surface,
        decoration: NavBarDecoration(
          colorBehindNavBar:
              theme.bottomNavigationBarTheme.backgroundColor ??
              theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, -2),
            ),
          ],
        ),
      ),
    );
  }
}
