import 'package:edugate/core/routings/routers.dart';
import 'package:flutter/material.dart';

class QuickActionsMobile extends StatelessWidget {
  final BuildContext context;

  const QuickActionsMobile(this.context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'إجراءات سريعة',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.9,
            children: [
              ActionButton(
                icon: Icons.person_add,
                label: 'تسجيل طالب',
                color: Colors.blue,
                route: Routers.studentRegistration,
              ),
              ActionButton(
                icon: Icons.payment,
                label: 'تسجيل مصروفات',
                color: Colors.green,
                route: Routers.recordPayment,
              ),
              ActionButton(
                icon: Icons.receipt_long,
                label: 'التقارير المالية',
                color: Colors.purple,
                route: Routers.financialReports,
              ),
              ActionButton(
                icon: Icons.check_circle,
                label: 'حضور الموظفين',
                color: Colors.teal,
                route: Routers.staffAttendance,
              ),
              ActionButton(
                icon: Icons.inventory,
                label: 'المخزون',
                color: Colors.orange,
                route: Routers.inventory,
              ),
              ActionButton(
                icon: Icons.campaign,
                label: 'إرسال إشعار',
                color: Colors.red,
                route: Routers.sendNotification,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final String route;

  const ActionButton({super.key, 
    required this.icon,
    required this.label,
    required this.color,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.of(context,rootNavigator: true).pushNamed(route),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                SizedBox(height: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
