import 'package:edugate/features/staff_attend/data/teacher_management_model.dart';
import 'package:edugate/features/staff/ui/add_employee_dialog.dart';
import 'package:edugate/features/staff/ui/widgets/mobile/mobile_employee_card.dart';
import 'package:edugate/features/staff/ui/widgets/mobile/mobile_employee_details_dialog.dart';
import 'package:edugate/features/staff/ui/widgets/mobile/mobile_empty_state.dart';
import 'package:edugate/features/staff/ui/widgets/mobile/mobile_staff_app_bar.dart';
import 'package:edugate/features/staff/ui/widgets/mobile/mobile_staff_search_bar.dart';
import 'package:edugate/features/staff/ui/widgets/mobile/mobile_staff_stats_row.dart';
import 'package:edugate/features/staff/ui/widgets/mobile/mobile_staff_type_filter.dart';
import 'package:flutter/material.dart';

class MobileStaffManagementScreen extends StatefulWidget {
  const MobileStaffManagementScreen({super.key});

  @override
  State<MobileStaffManagementScreen> createState() =>
      _MobileStaffManagementScreenState();
}

class _MobileStaffManagementScreenState
    extends State<MobileStaffManagementScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedType = 'all';
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
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => MobileEmployeeDetailsDialog(employee: employee),
    );
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => FilterBottomSheet(
        selectedType: _selectedType,
        onTypeSelected: (type) {
          _onTypeChanged(type);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      appBar: MobileStaffAppBar(
        onBack: () => Navigator.pop(context),
        onFilter: _showFilterSheet,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddEmployeeDialog,
        icon: Icon(Icons.person_add),
        label: Text('إضافة موظف'),
        backgroundColor: Color(0xFF7C3AED),
      ),
      body: Column(
        children: [
          MobileStaffSearchBar(
            controller: _searchController,
            onChanged: _onSearchChanged,
          ),
          MobileStaffTypeFilter(
            employees: _employees,
            selectedType: _selectedType,
            onTypeChanged: _onTypeChanged,
          ),
          MobileStaffStatsRow(employees: _employees),
          Expanded(
            child: _filteredEmployees.isEmpty
                ? MobileEmptyState()
                : ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: _filteredEmployees.length,
                    itemBuilder: (context, index) {
                      return MobileEmployeeCard(
                        employee: _filteredEmployees[index],
                        onTap: () => _showEmployeeDetails(_filteredEmployees[index]),
                        onEdit: (employee) {
                          // TODO: Implement edit
                        },
                        onDelete: (employee) {
                          // TODO: Implement delete
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class FilterBottomSheet extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeSelected;

  const FilterBottomSheet({super.key, 
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final filterOptions = [
      {'value': 'all', 'label': 'الكل', 'icon': Icons.apps, 'color': Colors.grey},
      {'value': 'teacher', 'label': 'معلمين', 'icon': Icons.school, 'color': Colors.purple},
      {'value': 'admin', 'label': 'إداريين', 'icon': Icons.admin_panel_settings, 'color': Colors.blue},
      {'value': 'cleaner', 'label': 'نظافة', 'icon': Icons.cleaning_services, 'color': Colors.teal},
      {'value': 'driver', 'label': 'سائقين', 'icon': Icons.directions_bus, 'color': Colors.orange},
      {'value': 'security', 'label': 'أمن', 'icon': Icons.security, 'color': Colors.red},
      {'value': 'maintenance', 'label': 'صيانة', 'icon': Icons.build, 'color': Colors.brown},
    ];

    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.filter_list, color: Color(0xFF7C3AED)),
              SizedBox(width: 12),
              Text(
                'تصفية الموظفين',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: filterOptions.map((option) {
              final isSelected = selectedType == option['value'];
              return GestureDetector(
                onTap: () => onTypeSelected(option['value'] as String),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? (option['color'] as Color).withOpacity(0.1)
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? (option['color'] as Color)
                          : Colors.grey[300]!,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        option['icon'] as IconData,
                        size: 18,
                        color: isSelected
                            ? (option['color'] as Color)
                            : Colors.grey[600],
                      ),
                      SizedBox(width: 8),
                      Text(
                        option['label'] as String,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected
                              ? (option['color'] as Color)
                              : Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7C3AED),
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('إغلاق', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
