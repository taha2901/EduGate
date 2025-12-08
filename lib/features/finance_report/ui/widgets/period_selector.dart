import 'package:flutter/material.dart';

class PeriodSelectorWidget extends StatelessWidget {
  final String selectedPeriod;
  final DateTime startDate;
  final DateTime endDate;
  final Function(String period, DateTime start, DateTime end) onPeriodChanged;

  const PeriodSelectorWidget({
    super.key,
    required this.selectedPeriod,
    required this.startDate,
    required this.endDate,
    required this.onPeriodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الفترة الزمنية',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              PeriodChip(
                label: 'شهر',
                value: 'month',
                groupValue: selectedPeriod,
                onTap: () {
                  onPeriodChanged(
                    'month',
                    DateTime.now().subtract(Duration(days: 30)),
                    DateTime.now(),
                  );
                },
              ),
              SizedBox(width: 8),
              PeriodChip(
                label: 'ربع سنوي',
                value: 'quarter',
                groupValue: selectedPeriod,
                onTap: () {
                  onPeriodChanged(
                    'quarter',
                    DateTime.now().subtract(Duration(days: 90)),
                    DateTime.now(),
                  );
                },
              ),
              SizedBox(width: 8),
              PeriodChip(
                label: 'سنة',
                value: 'year',
                groupValue: selectedPeriod,
                onTap: () {
                  onPeriodChanged(
                    'year',
                    DateTime.now().subtract(Duration(days: 365)),
                    DateTime.now(),
                  );
                },
              ),
              SizedBox(width: 8),
              PeriodChip(
                label: 'مخصص',
                value: 'custom',
                groupValue: selectedPeriod,
                onTap: () => _selectCustomPeriod(context),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'من ${startDate.day}/${startDate.month}/${startDate.year} إلى ${endDate.day}/${endDate.month}/${endDate.year}',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  void _selectCustomPeriod(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(start: startDate, end: endDate),
    );

    if (picked != null) {
      onPeriodChanged('custom', picked.start, picked.end);
    }
  }
}


class PeriodChip extends StatelessWidget {
  final String label;
  final String value;
  final String groupValue;
  final VoidCallback onTap;

  const PeriodChip({super.key, 
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF7C3AED) : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.white : Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
