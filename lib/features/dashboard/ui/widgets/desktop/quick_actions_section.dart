import 'package:edugate/core/routings/routers.dart';
import 'package:edugate/features/dashboard/ui/widgets/desktop/action_item.dart';
import 'package:flutter/material.dart';

class QuickActionsSection extends StatelessWidget {
  final BuildContext context;

  const QuickActionsSection(this.context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'إجراءات سريعة',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: ActionItem(
                  icon: Icons.person_add,
                  title: 'تسجيل طالب جديد',
                  color: Colors.blue,
                  onTap: () =>
                      Navigator.pushNamed(context, Routers.studentRegistration),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ActionItem(
                  icon: Icons.payment,
                  title: 'تسجيل مصروفات',
                  color: Colors.green,
                  onTap: () =>
                      Navigator.pushNamed(context, Routers.recordPayment),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ActionItem(
                  icon: Icons.check_circle,
                  title: 'حضور الموظفين',
                  color: Colors.teal,
                  onTap: () =>
                      Navigator.pushNamed(context, Routers.staffAttendance),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Expanded(
                child: ActionItem(
                  icon: Icons.inventory,
                  title: 'إدارة المخزون',
                  color: Colors.orange,
                  onTap: () => Navigator.pushNamed(context, Routers.inventory),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ActionItem(
                  icon: Icons.notifications,
                  title: 'إرسال إشعار',
                  color: Colors.purple,
                  onTap: () =>
                      Navigator.pushNamed(context, Routers.sendNotification),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ActionItem(
                  icon: Icons.receipt_long,
                  title: 'التقارير المالية',
                  color: Colors.indigo,
                  onTap: () =>
                      Navigator.pushNamed(context, Routers.financialReports),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
