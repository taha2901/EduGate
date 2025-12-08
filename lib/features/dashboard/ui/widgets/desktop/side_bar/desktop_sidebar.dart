
import 'package:edugate/core/routings/routers.dart';
import 'package:edugate/features/dashboard/ui/widgets/desktop/side_bar/nav_item.dart';
import 'package:flutter/material.dart';

class DesktopSidebar extends StatelessWidget {
  const DesktopSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF7C3AED), Color(0xFF5B21B6)],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                Icon(Icons.school, size: 64, color: Colors.white),
                SizedBox(height: 16),
                Text(
                  'مدرسة المستقبل',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'نظام الإدارة',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                NavItem(
                  icon: Icons.dashboard,
                  title: 'لوحة التحكم',
                  isActive: true,
                  onTap: () {
                    Navigator.pushNamed(context, Routers.adminDashboard);
                  },
                ),
                SizedBox(height: 8),
                SectionHeader('الإدارة الأكاديمية'),
                NavItem(
                  icon: Icons.school,
                  title: 'تسجيل الطلاب',
                  onTap: () {
                    Navigator.pushNamed(context, Routers.studentRegistration);
                  },
                ),
                NavItem(
                  icon: Icons.people,
                  title: 'إدارة الطلاب',
                  onTap: () {
                    Navigator.pushNamed(context, Routers.studentsManagement);
                  },
                ),
                NavItem(
                  icon: Icons.person,
                  title: 'إدارة الموظفين',
                  onTap: () {
                    Navigator.pushNamed(context, Routers.teachersManagement);
                  },
                ),
                
                SizedBox(height: 16),
                SectionHeader('الإدارة المالية'),
                NavItem(
                  icon: Icons.payment,
                  title: 'تسجيل مصروفات',
                  onTap: () {
                    Navigator.pushNamed(context, Routers.recordPayment);
                  },
                ),
                NavItem(
                  icon: Icons.receipt_long,
                  title: 'التقارير المالية',
                  onTap: () {
                    Navigator.pushNamed(context, Routers.financialReports);
                  },
                ),
                SizedBox(height: 16),
                SectionHeader('العمليات'),
                NavItem(
                  icon: Icons.check_circle,
                  title: 'حضور الموظفين',
                  onTap: () {
                    Navigator.pushNamed(context, Routers.staffAttendance);
                  },
                ),
                NavItem(
                  icon: Icons.inventory,
                  title: 'المخزون',
                  onTap: () {
                    Navigator.pushNamed(context, Routers.inventory);
                  },
                ),
                NavItem(
                  icon: Icons.notifications,
                  title: 'الإشعارات',
                  onTap: () {
                    Navigator.pushNamed(context, Routers.sendNotification);
                  },
                ),
                SizedBox(height: 16),
                SectionHeader('التقارير'),
                NavItem(
                  icon: Icons.campaign,
                  title: 'الإعلانات',
                  onTap: () {
                    Navigator.pushNamed(context, Routers.announcements);
                  },
                ),
              ],
            ),
          ),
          Divider(color: Colors.white24),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.admin_panel_settings, color: Color(0xFF7C3AED)),
            ),
            title: Text(
              'Admin',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'مدير النظام',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            trailing: IconButton(
              icon: Icon(Icons.logout, color: Colors.white),
              onPressed: () {},
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}



class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white54,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
