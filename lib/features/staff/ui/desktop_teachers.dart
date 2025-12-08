import 'package:edugate/features/staff_attend/data/teacher_management_model.dart';
import 'package:edugate/features/staff/ui/add_employee_dialog.dart';
import 'package:edugate/features/staff/ui/widgets/desktop/employee_details_dialog.dart';
import 'package:edugate/features/staff/ui/widgets/desktop/staff_data_table.dart';
import 'package:edugate/features/staff/ui/widgets/desktop/staff_header.dart';
import 'package:edugate/features/staff/ui/widgets/desktop/staff_search_bar.dart';
import 'package:edugate/features/staff/ui/widgets/desktop/staff_stats_cards.dart';
import 'package:edugate/features/staff/ui/widgets/desktop/staff_type_filter.dart';
import 'package:flutter/material.dart';

class DesktopStaffManagementScreen extends StatefulWidget {
  const DesktopStaffManagementScreen({super.key});

  @override
  State<DesktopStaffManagementScreen> createState() =>
      _DesktopStaffManagementScreenState();
}

class _DesktopStaffManagementScreenState
    extends State<DesktopStaffManagementScreen> {
  String _selectedType = 'all';
  final _searchController = TextEditingController();
  List<EmployeeModel> _employees = [];

  @override
  void initState() {
    super.initState();
    _loadEmployees();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadEmployees() {
    setState(() {
      _employees = EmployeeDummyData.getAllEmployees();
    });
  }

  List<EmployeeModel> get _filteredEmployees {
    var filtered = _selectedType == 'all'
        ? _employees
        : _employees.where((e) => e.employeeType == _selectedType).toList();

    final query = _searchController.text.toLowerCase();
    if (query.isNotEmpty) {
      filtered = filtered.where((employee) {
        return employee.name.toLowerCase().contains(query) ||
            employee.employeeId.toLowerCase().contains(query) ||
            (employee.department?.toLowerCase().contains(query) ?? false) ||
            (employee.position?.toLowerCase().contains(query) ?? false);
      }).toList();
    }

    return filtered;
  }

  void _onTypeChanged(String newType) {
    setState(() {
      _selectedType = newType;
    });
  }

  void _onSearchChanged(String query) {
    setState(() {});
  }

  void _showAddEmployeeDialog() {
    showDialog(
      context: context,
      builder: (context) => AddEmployeeDialog(),
    );
  }

  void _showEmployeeDetails(EmployeeModel employee) {
    showDialog(
      context: context,
      builder: (context) => EmployeeDetailsDialog(employee: employee),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5F9),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StaffHeader(
              totalEmployees: _employees.length,
              onAddEmployee: _showAddEmployeeDialog,
              onBack: () => Navigator.pop(context),
            ),
            SizedBox(height: 24),
            StaffStatsCards(employees: _employees),
            SizedBox(height: 24),
            StaffTypeFilter(
              employees: _employees,
              selectedType: _selectedType,
              onTypeChanged: _onTypeChanged,
            ),
            SizedBox(height: 24),
            StaffSearchBar(
              controller: _searchController,
              onSearchChanged: _onSearchChanged,
            ),
            SizedBox(height: 24),
            Expanded(
              child: StaffDataTable(
                employees: _filteredEmployees,
                onViewDetails: _showEmployeeDetails,
                onEdit: (employee) {
                  // TODO: Implement edit
                },
                onDelete: (employee) {
                  // TODO: Implement delete
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
