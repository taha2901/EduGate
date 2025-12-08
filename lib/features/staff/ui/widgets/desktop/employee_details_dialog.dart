import 'package:edugate/features/staff_attend/data/teacher_management_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsDialog extends StatelessWidget {
  final EmployeeModel employee;

  const EmployeeDetailsDialog({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 700,
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPersonalInfo(),
                    SizedBox(height: 24),
                    Divider(),
                    SizedBox(height: 24),
                    if (employee.employeeType == 'teacher')
                      _buildTeacherInfo()
                    else
                      _buildStaffInfo(),
                    SizedBox(height: 24),
                    Divider(),
                    SizedBox(height: 24),
                    _buildEmploymentInfo(),
                  ],
                ),
              ),
            ),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final color = _getEmployeeTypeColor(employee.employeeType);

    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.8)],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Icon(
              _getEmployeeTypeIcon(employee.employeeType),
              size: 40,
              color: color,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employee.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _getEmployeeTypeLabel(employee.employeeType),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _getStatusColor(employee.status),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _getStatusText(employee.status),
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المعلومات الشخصية',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _InfoRow(
          icon: Icons.badge,
          label: 'الرقم الوظيفي',
          value: employee.employeeId,
        ),
        SizedBox(height: 12),
        _InfoRow(
          icon: Icons.phone,
          label: 'رقم الجوال',
          value: employee.phone,
        ),
        if (employee.email.isNotEmpty) ...[
          SizedBox(height: 12),
          _InfoRow(
            icon: Icons.email,
            label: 'البريد الإلكتروني',
            value: employee.email,
          ),
        ],
        if (employee.nationalId != null) ...[
          SizedBox(height: 12),
          _InfoRow(
            icon: Icons.credit_card,
            label: 'رقم الهوية',
            value: employee.nationalId!,
          ),
        ],
        if (employee.address != null) ...[
          SizedBox(height: 12),
          _InfoRow(
            icon: Icons.home,
            label: 'العنوان',
            value: employee.address!,
          ),
        ],
      ],
    );
  }

  Widget _buildTeacherInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المعلومات الأكاديمية',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _InfoRow(
          icon: Icons.category,
          label: 'القسم',
          value: employee.department ?? '-',
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Icon(Icons.book, size: 20, color: Color(0xFF7C3AED)),
            SizedBox(width: 12),
            Text(
              'المواد: ',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            Expanded(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: (employee.subjects ?? []).map((subject) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      subject,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(Icons.class_, color: Colors.blue, size: 32),
                    SizedBox(height: 8),
                    Text(
                      '${employee.totalClasses ?? 0}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      'صف دراسي',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(Icons.people, color: Colors.green, size: 32),
                    SizedBox(height: 8),
                    Text(
                      '${employee.totalStudents ?? 0}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      'طالب',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 32),
                    SizedBox(height: 8),
                    Text(
                      '${employee.performanceScore ?? 0}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      'التقييم',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStaffInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'معلومات الوظيفة',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _InfoRow(
          icon: Icons.work,
          label: 'المنصب',
          value: employee.position ?? '-',
        ),
        if (employee.workShift != null) ...[
          SizedBox(height: 12),
          _InfoRow(
            icon: Icons.schedule,
            label: 'الوردية',
            value: employee.workShift!,
          ),
        ],
      ],
    );
  }

  Widget _buildEmploymentInfo() {
    final yearsOfService = DateTime.now().difference(employee.joinDate).inDays ~/ 365;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'معلومات التوظيف',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _InfoRow(
          icon: Icons.calendar_today,
          label: 'تاريخ التعيين',
          value: '${employee.joinDate.day}/${employee.joinDate.month}/${employee.joinDate.year}',
        ),
        SizedBox(height: 12),
        _InfoRow(
          icon: Icons.access_time,
          label: 'سنوات الخدمة',
          value: '$yearsOfService سنة',
        ),
        if (employee.salary != null) ...[
          SizedBox(height: 12),
          _InfoRow(
            icon: Icons.attach_money,
            label: 'الراتب الشهري',
            value: '${employee.salary!.toStringAsFixed(0)} ج.م',
          ),
        ],
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.edit),
              label: Text('تعديل البيانات'),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14),
                side: BorderSide(color: Color(0xFF7C3AED)),
                foregroundColor: Color(0xFF7C3AED),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('إغلاق'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7C3AED),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getEmployeeTypeColor(String type) {
    switch (type) {
      case 'teacher': return Colors.purple;
      case 'admin': return Colors.blue;
      case 'cleaner': return Colors.teal;
      case 'driver': return Colors.orange;
      case 'security': return Colors.red;
      case 'maintenance': return Colors.brown;
      default: return Colors.grey;
    }
  }

  IconData _getEmployeeTypeIcon(String type) {
    switch (type) {
      case 'teacher': return Icons.school;
      case 'admin': return Icons.admin_panel_settings;
      case 'cleaner': return Icons.cleaning_services;
      case 'driver': return Icons.directions_bus;
      case 'security': return Icons.security;
      case 'maintenance': return Icons.build;
      default: return Icons.person;
    }
  }

  String _getEmployeeTypeLabel(String type) {
    switch (type) {
      case 'teacher': return 'معلم';
      case 'admin': return 'إداري';
      case 'cleaner': return 'نظافة';
      case 'driver': return 'سائق';
      case 'security': return 'أمن';
      case 'maintenance': return 'صيانة';
      default: return type;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'active': return Colors.green;
      case 'inactive': return Colors.red;
      case 'on_leave': return Colors.orange;
      default: return Colors.grey;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'active': return 'نشط';
      case 'inactive': return 'غير نشط';
      case 'on_leave': return 'في إجازة';
      default: return status;
    }
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Color(0xFF7C3AED)),
        SizedBox(width: 12),
        Text(
          '$label: ',
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
