import 'package:edugate/features/dashboard/ui/widgets/mobile/financial_overview.dart';
import 'package:edugate/features/dashboard/ui/widgets/mobile/quick_actions.dart';
import 'package:edugate/features/dashboard/ui/widgets/mobile/quick_stats.dart';
import 'package:flutter/material.dart';
import 'package:edugate/core/routings/routers.dart';

class MobileAdminDashboard extends StatelessWidget {
  const MobileAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Color(0xFF7C3AED),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'لوحة التحكم',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'مدرسة المستقبل الخاصة',
              style: TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FinancialOverviewMobile(),
            SizedBox(height: 16),
            QuickStatsMobile(),
            SizedBox(height: 16),
            QuickActionsMobile(context),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}