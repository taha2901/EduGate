import 'package:edugate/features/staff_attend/data/teacher_management_model.dart';
import 'package:flutter/material.dart';

class EmployeeActionsCell extends StatelessWidget {
  final EmployeeModel employee;
  final VoidCallback onView;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const EmployeeActionsCell({
    super.key,
    required this.employee,
    required this.onView,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Tooltip(
          message: 'عرض التفاصيل',
          child: IconButton(
            icon: Icon(Icons.visibility, color: Colors.blue, size: 20),
            onPressed: onView,
            padding: EdgeInsets.all(8),
            constraints: BoxConstraints(),
          ),
        ),
        SizedBox(width: 4),
        Tooltip(
          message: 'تعديل',
          child: IconButton(
            icon: Icon(Icons.edit, color: Colors.orange, size: 20),
            onPressed: onEdit,
            padding: EdgeInsets.all(8),
            constraints: BoxConstraints(),
          ),
        ),
        SizedBox(width: 4),
        Tooltip(
          message: 'حذف',
          child: IconButton(
            icon: Icon(Icons.delete, color: Colors.red, size: 20),
            onPressed: () => _showDeleteConfirmation(context),
            padding: EdgeInsets.all(8),
            constraints: BoxConstraints(),
          ),
        ),
      ],
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.warning, color: Colors.red, size: 28),
            SizedBox(width: 12),
            Text('تأكيد الحذف'),
          ],
        ),
        content: Text(
          'هل أنت متأكد من حذف الموظف "${employee.name}"؟\nلا يمكن التراجع عن هذا الإجراء.',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text('حذف'),
          ),
        ],
      ),
    );
  }
}
