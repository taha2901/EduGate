// features/admin/announcements/ui/widgets/mobile/announcement_filter_bar.dart
import 'package:flutter/material.dart';

class AnnouncementFilterBar extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterChanged;

  const AnnouncementFilterBar({
    Key? key,
    required this.selectedFilter,
    required this.onFilterChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filters = {
      'all': {'label': 'الكل', 'color': Colors.grey},
      'urgent': {'label': 'عاجل', 'color': Colors.red},
      'high': {'label': 'مهم', 'color': Colors.orange},
      'medium': {'label': 'متوسط', 'color': Colors.blue},
      'students': {'label': 'الطلاب', 'color': Colors.purple},
      'teachers': {'label': 'المعلمين', 'color': Colors.teal},
      'parents': {'label': 'أولياء الأمور', 'color': Colors.green},
    };

    return Container(
      height: 60,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final entry = filters.entries.elementAt(index);
          final isSelected = entry.key == selectedFilter;
          final color = entry.value['color'] as Color;

          return GestureDetector(
            onTap: () => onFilterChanged(entry.key),
            child: Container(
              margin: EdgeInsets.only(left: 8),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? color : Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? color : Colors.grey[300]!,
                  width: isSelected ? 1.5 : 1,
                ),
              ),
              child: Center(
                child: Text(
                  entry.value['label'] as String,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? Colors.white : Colors.grey[700],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
