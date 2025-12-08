import 'package:edugate/features/staff_attend/data/teacher_management_model.dart';
import 'package:edugate/features/staff_attend/ui/widgets/attedned_empty.dart';
import 'package:edugate/features/staff_attend/ui/widgets/attendance_employee_card.dart';
import 'package:edugate/features/staff_attend/ui/widgets/attendance_filters.dart';
import 'package:edugate/features/staff_attend/ui/widgets/attendance_header.dart';
import 'package:edugate/features/staff_attend/ui/widgets/attendance_stats_cards.dart';
import 'package:flutter/material.dart';

class StaffAttendanceScreen extends StatefulWidget {
  const StaffAttendanceScreen({super.key});

  @override
  State<StaffAttendanceScreen> createState() => _StaffAttendanceScreenState();
}

class _StaffAttendanceScreenState extends State<StaffAttendanceScreen> {
  DateTime _selectedDate = DateTime.now();
  String _filterType = 'all';
  String _filterStatus = 'all';
  final _searchController = TextEditingController();
  
  List<EmployeeModel> _employees = [];
  Map<String, AttendanceRecord> _attendanceRecords = {};

  @override
  void initState() {
    super.initState();
    _loadEmployees();
    _loadTodayAttendance();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadEmployees() {
    _employees = EmployeeDummyData.getAllEmployees();
  }

  void _loadTodayAttendance() {
    // Simulate loading today's attendance
    // In real app, this will fetch from API
    for (var employee in _employees) {
      _attendanceRecords[employee.id] = AttendanceRecord(
        employeeId: employee.id,
        date: _selectedDate,
        status: 'pending', // pending, present, late, absent
        checkInTime: null,
        checkOutTime: null,
      );
    }
  }

  List<EmployeeModel> get _filteredEmployees {
    var filtered = _employees.where((emp) {
      // Filter by type
      if (_filterType == 'teacher' && emp.employeeType != 'teacher') return false;
      if (_filterType == 'staff' && emp.employeeType == 'teacher') return false;

      // Filter by status
      if (_filterStatus != 'all') {
        final record = _attendanceRecords[emp.id];
        if (record?.status != _filterStatus) return false;
      }

      // Search
      final query = _searchController.text.toLowerCase();
      if (query.isNotEmpty) {
        return emp.name.toLowerCase().contains(query) ||
            emp.employeeId.toLowerCase().contains(query);
      }
      return true;
    }).toList();

    return filtered;
  }

  Map<String, int> get _stats {
    int present = 0, absent = 0, late = 0, pending = 0;
    
    _attendanceRecords.forEach((key, record) {
      switch (record.status) {
        case 'present':
          present++;
          break;
        case 'absent':
          absent++;
          break;
        case 'late':
          late++;
          break;
        case 'pending':
          pending++;
          break;
      }
    });

    return {
      'total': _employees.length,
      'present': present,
      'absent': absent,
      'late': late,
      'pending': pending,
    };
  }

  void _updateAttendance(String employeeId, String status) {
    setState(() {
      final record = _attendanceRecords[employeeId];
      if (record != null) {
        record.status = status;
        if (status == 'present' || status == 'late') {
          record.checkInTime = TimeOfDay.now();
        }
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 12),
            Text('تم تحديث الحضور'),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _markAllPresent() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 12),
            Text('تحضير الكل؟'),
          ],
        ),
        content: Text(
          'هل تريد وضع علامة حضور لجميع الموظفين الذين لم يتم تحضيرهم؟',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _attendanceRecords.forEach((key, record) {
                  if (record.status == 'pending') {
                    record.status = 'present';
                    record.checkInTime = TimeOfDay(hour: 8, minute: 0);
                  }
                });
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('تم تحضير جميع الموظفين'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: Text('تحضير الكل'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Color(0xFF7C3AED),
        elevation: 0,
        title: Text(
          'حضور وانصراف الموظفين',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.download, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('جاري تصدير التقرير...')),
              );
            },
            tooltip: 'تصدير التقرير',
          ),
        ],
      ),
      floatingActionButton: _stats['pending']! > 0
          ? FloatingActionButton.extended(
              onPressed: _markAllPresent,
              icon: Icon(Icons.done_all),
              label: Text('تحضير الكل'),
              backgroundColor: Colors.green,
            )
          : null,
      body: Column(
        children: [
          AttendanceHeader(
            selectedDate: _selectedDate,
            onDateChanged: (date) {
              setState(() {
                _selectedDate = date;
                _loadTodayAttendance();
              });
            },
          ),
          AttendanceStatsCards(stats: _stats),
          AttendanceFilters(
            filterType: _filterType,
            filterStatus: _filterStatus,
            searchController: _searchController,
            onTypeChanged: (type) {
              setState(() => _filterType = type);
            },
            onStatusChanged: (status) {
              setState(() => _filterStatus = status);
            },
            onSearchChanged: (query) {
              setState(() {});
            },
          ),
          Expanded(
            child: _filteredEmployees.isEmpty
                ? AttenedEmptyState()
                : ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: _filteredEmployees.length,
                    itemBuilder: (context, index) {
                      final employee = _filteredEmployees[index];
                      final record = _attendanceRecords[employee.id];
                      
                      return AttendanceEmployeeCard(
                        employee: employee,
                        record: record!,
                        onStatusChange: (status) {
                          _updateAttendance(employee.id, status);
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

class AttendanceRecord {
  final String employeeId;
  final DateTime date;
  String status; // pending, present, late, absent
  TimeOfDay? checkInTime;
  TimeOfDay? checkOutTime;

  AttendanceRecord({
    required this.employeeId,
    required this.date,
    required this.status,
    this.checkInTime,
    this.checkOutTime,
  });
}

