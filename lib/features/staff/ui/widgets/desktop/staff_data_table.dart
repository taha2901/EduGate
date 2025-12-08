import 'package:edugate/features/staff_attend/data/teacher_management_model.dart';
import 'package:edugate/features/staff/ui/widgets/desktop/emploee_action_cell.dart';
import 'package:edugate/features/staff/ui/widgets/desktop/emploee_salary_cell.dart';
import 'package:edugate/features/staff/ui/widgets/desktop/emploee_status_chip.dart';
import 'package:edugate/features/staff/ui/widgets/desktop/emploee_type_chip.dart';
import 'package:edugate/features/staff/ui/widgets/desktop/employ_info_cell.dart';
import 'package:edugate/features/staff/ui/widgets/desktop/empty_emploee_state_search.dart';
import 'package:flutter/material.dart';

class StaffDataTable extends StatelessWidget {
  final List<EmployeeModel> employees;
  final Function(EmployeeModel) onViewDetails;
  final Function(EmployeeModel) onEdit;
  final Function(EmployeeModel) onDelete;

  const StaffDataTable({
    super.key,
    required this.employees,
    required this.onViewDetails,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (employees.isEmpty) {
      return EmptyEmployeeState();
    }
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
          // Header
          Row(
            children: [
              Icon(Icons.table_chart, color: Color(0xFF7C3AED), size: 20),
              SizedBox(width: 8),
              Text(
                'قائمة الموظفين (${employees.length})',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Scrollable Table
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                      ),
                      child: DataTable(
                        headingRowColor: MaterialStateProperty.all(
                          Colors.grey[100],
                        ),
                        headingRowHeight: 56,
                        dataRowHeight: 72,
                        columnSpacing: 24,
                        horizontalMargin: 0,
                        columns: [
                          DataColumn(
                            label: SizedBox(
                              width: 200,
                              child: Text(
                                'الموظف',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 120,
                              child: Text(
                                'الرقم الوظيفي',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 100,
                              child: Text(
                                'النوع',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 150,
                              child: Text(
                                'القسم/المنصب',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 120,
                              child: Text(
                                'الراتب',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 100,
                              child: Text(
                                'الحالة',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 140,
                              child: Text(
                                'الإجراءات',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                        rows: employees.map((employee) {
                          return DataRow(
                            cells: [
                              DataCell(
                                SizedBox(
                                  width: 200,
                                  child: EmployeeInfoCell(employee: employee),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 120,
                                  child: Text(employee.employeeId),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 100,
                                  child: EmployeeTypeChip(
                                    employeeType: employee.employeeType,
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    employee.department ??
                                        employee.position ??
                                        '-',
                                    style: TextStyle(fontSize: 14),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 120,
                                  child: EmployeeSalaryCell(
                                    salary: employee.salary,
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 100,
                                  child: EmployeeStatusChip(
                                    status: employee.status,
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 140,
                                  child: EmployeeActionsCell(
                                    employee: employee,
                                    onView: () => onViewDetails(employee),
                                    onEdit: () => onEdit(employee),
                                    onDelete: () => onDelete(employee),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
