import 'package:edugate/features/dashboard/ui/widgets/desktop/side_bar/desktop_sidebar.dart';
import 'package:edugate/features/dashboard/ui/widgets/desktop/financial_overview.dart';
import 'package:edugate/features/dashboard/ui/widgets/desktop/quick_actions_section.dart';
import 'package:edugate/features/dashboard/ui/widgets/desktop/stats_grid.dart';
import 'package:edugate/features/dashboard/ui/widgets/desktop/desktop_header.dart';
import 'package:edugate/features/dashboard/ui/widgets/desktop/welcome_section.dart';
import 'package:flutter/material.dart';

class DesktopAdminDashboard extends StatelessWidget {
  const DesktopAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5F9),
      body: Row(
        children: [
          DesktopSidebar(),
          Expanded(
            child: Column(
              children: [
                DesktopHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WelcomeSection(),
                        SizedBox(height: 32),
                        FinancialOverview(),
                        SizedBox(height: 32),
                        StatsGrid(),
                        SizedBox(height: 32),
                        QuickActionsSection(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
