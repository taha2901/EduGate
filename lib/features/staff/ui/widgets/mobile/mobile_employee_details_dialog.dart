// features/admin/staff/ui/widgets/mobile/mobile_employee_details_dialog.dart
import 'package:edugate/features/staff_attend/data/teacher_management_model.dart';
import 'package:edugate/features/staff/ui/widgets/desktop/employee_helpers.dart';
import 'package:flutter/material.dart';

class MobileEmployeeDetailsDialog extends StatelessWidget {
  final EmployeeModel employee;

  const MobileEmployeeDetailsDialog({
    Key? key,
    required this.employee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final typeColor = EmployeeHelpers.getEmployeeTypeColor(employee.employeeType);

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: typeColor.withOpacity(0.1),
                  child: Icon(
                    EmployeeHelpers.getEmployeeTypeIcon(employee.employeeType),
                    color: typeColor,
                    size: 32,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        employee.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: typeColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          EmployeeHelpers.getEmployeeTypeLabel(
                            employee.employeeType,
                          ),
                          style: TextStyle(
                            fontSize: 12,
                            color: typeColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Status Badge
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: EmployeeHelpers.getStatusColor(employee.status)
                    .withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    EmployeeHelpers.getStatusIcon(employee.status),
                    size: 18,
                    color: EmployeeHelpers.getStatusColor(employee.status),
                  ),
                  SizedBox(width: 8),
                  Text(
                    EmployeeHelpers.getStatusText(employee.status),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: EmployeeHelpers.getStatusColor(employee.status),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Basic Info
            _SectionTitle(title: 'المعلومات الأساسية', icon: Icons.info),
            SizedBox(height: 12),
            _InfoRow(label: 'الرقم الوظيفي', value: employee.employeeId),
            _InfoRow(label: 'رقم الهاتف', value: employee.phone),
            if (employee.email.isNotEmpty)
              _InfoRow(label: 'البريد الإلكتروني', value: employee.email),
            if (employee.nationalId != null)
              _InfoRow(label: 'الرقم القومي', value: employee.nationalId!),
            if (employee.address != null)
              _InfoRow(label: 'العنوان', value: employee.address!),
            _InfoRow(
              label: 'تاريخ التعيين',
              value: EmployeeHelpers.formatDate(employee.joinDate),
            ),
            _InfoRow(
              label: 'سنوات الخدمة',
              value: '${EmployeeHelpers.calculateYearsOfService(employee.joinDate)} سنة',
            ),
            SizedBox(height: 24),

            // Job Details
            if (employee.employeeType == 'teacher') ...[
              _SectionTitle(title: 'التفاصيل الوظيفية', icon: Icons.school),
              SizedBox(height: 12),
              _InfoRow(label: 'القسم', value: employee.department ?? '-'),
              _InfoRow(
                label: 'المواد',
                value: employee.subjects?.join(', ') ?? '-',
              ),
              _InfoRow(
                label: 'عدد الصفوف',
                value: '${employee.totalClasses ?? 0}',
              ),
              _InfoRow(
                label: 'عدد الطلاب',
                value: '${employee.totalStudents ?? 0}',
              ),
              if (employee.performanceScore != null)
                _InfoRow(
                  label: 'التقييم',
                  value: '${employee.performanceScore} / 5',
                ),
            ] else ...[
              _SectionTitle(title: 'التفاصيل الوظيفية', icon: Icons.work),
              SizedBox(height: 12),
              _InfoRow(label: 'المنصب', value: employee.position ?? '-'),
              if (employee.workShift != null)
                _InfoRow(label: 'الوردية', value: employee.workShift!),
            ],
            SizedBox(height: 24),

            // Salary
            if (employee.salary != null) ...[
              _SectionTitle(title: 'الراتب', icon: Icons.attach_money),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.account_balance_wallet,
                        color: Colors.green[700]),
                    SizedBox(width: 12),
                    Text(
                      EmployeeHelpers.formatSalary(employee.salary),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
            SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implement edit
                    },
                    icon: Icon(Icons.edit),
                    label: Text('تعديل'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implement delete
                    },
                    icon: Icon(Icons.delete),
                    label: Text('حذف'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionTitle({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Color(0xFF7C3AED), size: 20),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
