import 'package:flutter/material.dart';

class AttendanceFilters extends StatelessWidget {
  final String filterType;
  final String filterStatus;
  final TextEditingController searchController;
  final Function(String) onTypeChanged;
  final Function(String) onStatusChanged;
  final Function(String) onSearchChanged;

  const AttendanceFilters({
    super.key,
    required this.filterType,
    required this.filterStatus,
    required this.searchController,
    required this.onTypeChanged,
    required this.onStatusChanged,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          // Search Bar
          TextField(
            controller: searchController,
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              hintText: 'ابحث عن موظف...',
              prefixIcon: Icon(Icons.search, color: Color(0xFF7C3AED)),
              suffixIcon: searchController.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        searchController.clear();
                        onSearchChanged('');
                      },
                    )
                  : null,
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 12),

          // Employee Type Filter
          Row(
            children: [
              Icon(Icons.filter_list, size: 18, color: Colors.grey[600]),
              SizedBox(width: 8),
              Text(
                'النوع:',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(width: 8),
              FilterChip(
                label: 'الكل',
                value: 'all',
                groupValue: filterType,
                onTap: () => onTypeChanged('all'),
              ),
              SizedBox(width: 6),
              FilterChip(
                label: 'معلمين',
                value: 'teacher',
                groupValue: filterType,
                onTap: () => onTypeChanged('teacher'),
              ),
              SizedBox(width: 6),
              FilterChip(
                label: 'موظفين',
                value: 'staff',
                groupValue: filterType,
                onTap: () => onTypeChanged('staff'),
              ),
            ],
          ),
          SizedBox(height: 8),

          // Status Filter
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Icon(Icons.brightness_1, size: 18, color: Colors.grey[600]),
                SizedBox(width: 8),
                Text(
                  'الحالة:',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: 'الكل',
                  value: 'all',
                  groupValue: filterStatus,
                  onTap: () => onStatusChanged('all'),
                ),
                SizedBox(width: 6),
                FilterChip(
                  label: 'حاضر',
                  value: 'present',
                  groupValue: filterStatus,
                  color: Colors.green,
                  onTap: () => onStatusChanged('present'),
                ),
                SizedBox(width: 6),
                FilterChip(
                  label: 'متأخر',
                  value: 'late',
                  groupValue: filterStatus,
                  color: Colors.orange,
                  onTap: () => onStatusChanged('late'),
                ),
                SizedBox(width: 6),
                FilterChip(
                  label: 'غائب',
                  value: 'absent',
                  groupValue: filterStatus,
                  color: Colors.red,
                  onTap: () => onStatusChanged('absent'),
                ),
                SizedBox(width: 6),
                FilterChip(
                  label: 'معلق',
                  value: 'pending',
                  groupValue: filterStatus,
                  color: Colors.grey,
                  onTap: () => onStatusChanged('pending'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterChip extends StatelessWidget {
  final String label;
  final String value;
  final String groupValue;
  final Color? color;
  final VoidCallback onTap;

  const FilterChip({super.key, 
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    final chipColor = color ?? Color(0xFF7C3AED);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? chipColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? chipColor : Colors.grey[300]!,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.white : Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
