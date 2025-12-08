import 'package:edugate/features/staff_attend/data/teacher_management_model.dart';
import 'package:flutter/material.dart';

class TabletStaffManagementScreen extends StatefulWidget {
  const TabletStaffManagementScreen({super.key});

  @override
  State<TabletStaffManagementScreen> createState() => _TabletStaffManagementScreenState();
}

class _TabletStaffManagementScreenState extends State<TabletStaffManagementScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedType = 'all';
  List<EmployeeModel> _filteredEmployees = [];

  @override
  void initState() {
    super.initState();
    _filteredEmployees = _getAllEmployees();
  }

  List<EmployeeModel> _getAllEmployees() {
    return [
      // Same data as mobile...
      EmployeeModel(
        id: '1',
        name: 'أ. محمد أحمد',
        email: 'mohamed@edu.sa',
        phone: '0501234567',
        employeeId: 'T001',
        employeeType: 'teacher',
        department: 'رياضيات',
        subjects: ['جبر', 'هندسة'],
        status: 'active',
        totalClasses: 5,
        totalStudents: 120,
        joinDate: DateTime(2020, 1, 1),
        performanceScore: 4.8,
        salary: 8000,
      ),
      EmployeeModel(
        id: '2',
        name: 'محمود سعيد',
        email: 'mahmoud@edu.sa',
        phone: '0501234570',
        employeeId: 'A001',
        employeeType: 'admin',
        position: 'مدير إداري',
        status: 'active',
        joinDate: DateTime(2018, 5, 1),
        workShift: 'صباحي',
        salary: 6000,
      ),
      EmployeeModel(
        id: '3',
        name: 'أحمد حسين',
        email: '',
        phone: '0501234572',
        employeeId: 'C001',
        employeeType: 'cleaner',
        position: 'عامل نظافة',
        status: 'active',
        joinDate: DateTime(2022, 1, 1),
        workShift: 'صباحي',
        salary: 3000,
      ),
      EmployeeModel(
        id: '4',
        name: 'علي محمد',
        email: '',
        phone: '0501234573',
        employeeId: 'D001',
        employeeType: 'driver',
        position: 'سائق باص',
        status: 'active',
        joinDate: DateTime(2019, 8, 1),
        workShift: 'صباحي',
        salary: 4000,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Color(0xFF7C3AED),
        elevation: 0,
        title: Text('إدارة الموظفين', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: Icon(Icons.filter_list, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.download, color: Colors.white), onPressed: () {}),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.person_add),
        label: Text('إضافة موظف'),
        backgroundColor: Color(0xFF7C3AED),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'ابحث عن موظف...',
                          prefixIcon: Icon(Icons.search, color: Color(0xFF7C3AED)),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.filter_list),
                      label: Text('فلترة'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF7C3AED),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                _buildTypeChips(),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(24),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.4,
              ),
              itemCount: _filteredEmployees.length,
              itemBuilder: (context, index) {
                return _EmployeeGridCard(employee: _filteredEmployees[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeChips() {
    final types = [
      {'value': 'all', 'label': 'الكل', 'icon': Icons.apps, 'color': Colors.grey},
      {'value': 'teacher', 'label': 'معلمين', 'icon': Icons.school, 'color': Colors.purple},
      {'value': 'admin', 'label': 'إداريين', 'icon': Icons.admin_panel_settings, 'color': Colors.blue},
      {'value': 'cleaner', 'label': 'نظافة', 'icon': Icons.cleaning_services, 'color': Colors.teal},
      {'value': 'driver', 'label': 'سائقين', 'icon': Icons.directions_bus, 'color': Colors.orange},
      {'value': 'security', 'label': 'أمن', 'icon': Icons.security, 'color': Colors.red},
    ];

    return Wrap(
      spacing: 12,
      children: types.map((type) {
        final isSelected = _selectedType == type['value'];
        final color = type['color'] as Color;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedType = type['value'] as String;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? color.withOpacity(0.1) : Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? color : Colors.grey[300]!,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  type['icon'] as IconData,
                  size: 18,
                  color: isSelected ? color : Colors.grey[600],
                ),
                SizedBox(width: 8),
                Text(
                  type['label'] as String,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? color : Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _EmployeeGridCard extends StatelessWidget {
  final EmployeeModel employee;

  const _EmployeeGridCard({required this.employee});

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

  @override
  Widget build(BuildContext context) {
    final typeColor = _getEmployeeTypeColor(employee.employeeType);

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: typeColor.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: typeColor.withOpacity(0.1),
                child: Icon(
                  _getEmployeeTypeIcon(employee.employeeType),
                  color: typeColor,
                  size: 28,
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: typeColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _getEmployeeTypeLabel(employee.employeeType),
                      style: TextStyle(
                        fontSize: 11,
                        color: typeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getStatusColor(employee.status).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _getStatusText(employee.status),
                      style: TextStyle(
                        fontSize: 11,
                        color: _getStatusColor(employee.status),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            employee.name,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            employee.employeeId,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
          SizedBox(height: 8),
          Text(
            employee.employeeType == 'teacher'
                ? employee.department ?? '-'
                : employee.position ?? '-',
            style: TextStyle(fontSize: 13, color: Colors.grey[700]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          if (employee.salary != null)
            Row(
              children: [
                Icon(Icons.attach_money, size: 16, color: Colors.green),
                SizedBox(width: 4),
                Text(
                  '${employee.salary!.toStringAsFixed(0)} ج.م',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('عرض', style: TextStyle(fontSize: 13)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: typeColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.more_vert, size: 20),
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey[100],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
