// features/admin/attendance/ui/widgets/attendance_stats_cards.dart
import 'package:flutter/material.dart';

class AttendanceStatsCards extends StatelessWidget {
  final Map<String, int> stats;

  const AttendanceStatsCards({
    Key? key,
    required this.stats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: _StatCard(
              icon: Icons.check_circle,
              label: 'حاضر',
              value: '${stats['present']}',
              color: Colors.green,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: _StatCard(
              icon: Icons.schedule,
              label: 'متأخر',
              value: '${stats['late']}',
              color: Colors.orange,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: _StatCard(
              icon: Icons.cancel,
              label: 'غائب',
              value: '${stats['absent']}',
              color: Colors.red,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: _StatCard(
              icon: Icons.pending,
              label: 'معلق',
              value: '${stats['pending']}',
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
