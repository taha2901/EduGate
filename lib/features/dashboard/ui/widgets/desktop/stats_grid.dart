import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      childAspectRatio: 1.5,
      children: [
        StatCard(
          title: 'إجمالي الطلاب',
          value: '342',
          change: '+12',
          isPositive: true,
          icon: Icons.school,
          gradient: [Color(0xFF3B82F6), Color(0xFF2563EB)],
        ),
        StatCard(
          title: 'الموظفين',
          value: '48',
          change: '+2',
          isPositive: true,
          icon: Icons.people,
          gradient: [Color(0xFF10B981), Color(0xFF059669)],
        ),
        StatCard(
          title: 'الحضور اليوم',
          value: '45/48',
          change: '93.8%',
          isPositive: true,
          icon: Icons.check_circle,
          gradient: [Color(0xFF7C3AED), Color(0xFF5B21B6)],
        ),
        StatCard(
          title: 'أصناف المخزون',
          value: '156',
          change: '5 ناقص',
          isPositive: false,
          icon: Icons.inventory,
          gradient: [Color(0xFFF59E0B), Color(0xFFD97706)],
        ),
      ],
    );
  }
}


class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;
  final bool isPositive;
  final IconData icon;
  final List<Color> gradient;

  const StatCard({super.key, 
    required this.title,
    required this.value,
    required this.change,
    required this.isPositive,
    required this.icon,
    required this.gradient,
  });

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradient),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isPositive
                      ? Colors.green.withOpacity(0.1)
                      : Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      isPositive ? Icons.arrow_upward : Icons.warning,
                      color: isPositive ? Colors.green : Colors.red,
                      size: 12,
                    ),
                    SizedBox(width: 2),
                    Text(
                      change,
                      style: TextStyle(
                        fontSize: 11,
                        color: isPositive ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Text(title, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
