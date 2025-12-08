// ⭐ Widget مستخرج - نتيجة بحث الطالب في قائمة الدفعات
import 'package:flutter/material.dart';

class StudentSearchResultTile extends StatelessWidget {
  final Map<String, dynamic> student;
  final bool isSelected;
  final VoidCallback onTap;

  const StudentSearchResultTile({super.key, 
    required this.student,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: isSelected,
      selectedTileColor: Color(0xFF7C3AED).withOpacity(0.1),
      leading: CircleAvatar(
        backgroundColor: Color(0xFF7C3AED).withOpacity(0.1),
        child: Text(
          student['name'][0],
          style: TextStyle(
            color: Color(0xFF7C3AED),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        student['name'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('${student['id']} - ${student['grade']}'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'المتبقي',
            style: TextStyle(fontSize: 10, color: Colors.grey[600]),
          ),
          Text(
            '${student['balance']} ج.م',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: student['balance'] > 0 ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
