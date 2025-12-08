import 'package:edugate/core/helper/responsive_helper.dart';
import 'package:edugate/core/routings/routers.dart';
import 'package:edugate/core/widgets/common/app_text_form_field.dart';
import 'package:edugate/features/students/data/student_management_model.dart';
import 'package:edugate/features/students/ui/widgets/empty_students_widget.dart';
import 'package:edugate/features/students/ui/widgets/stats_item_students.dart';
import 'package:flutter/material.dart';

class MobileStudentsManagementScreen extends StatefulWidget {
  const MobileStudentsManagementScreen({super.key});

  @override
  State<MobileStudentsManagementScreen> createState() =>
      _MobileStudentsManagementScreenState();
}

class _MobileStudentsManagementScreenState
    extends State<MobileStudentsManagementScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedGrade = 'all';
  List<StudentManagementModel> _filteredStudents = [];

  @override
  void initState() {
    super.initState();
    _filteredStudents = StudentManagementModel.dummyStudents;
  }

  void _filterStudents(String query) {
    setState(() {
      _filteredStudents = StudentManagementModel.dummyStudents.where((student) {
        final matchesQuery =
            student.name.toLowerCase().contains(query.toLowerCase()) ||
            student.studentId.toLowerCase().contains(query.toLowerCase());
        final matchesGrade =
            _selectedGrade == 'all' || student.grade == _selectedGrade;
        return matchesQuery && matchesGrade;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Color(0xFF7C3AED),
        elevation: 0,
        title: Text(
          'إدارة الطلاب',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(
            context,
            rootNavigator: true,
          ).pushNamed(Routers.studentRegistration);
        },
        icon: Icon(Icons.person_add),
        label: Text('إضافة طالب'),
        backgroundColor: Color(0xFF7C3AED),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ResponsiveHelper.maxContentWidth(context),
          ),
          child: Column(
            children: [
              // Search Bar - استخدام UniversalFormField ⭐
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.white,
                child: UniversalFormField(
                  controller: _searchController,
                  hintText: 'ابحث عن طالب...',
                  prefixIcon: Icon(Icons.search, color: Color(0xFF7C3AED)),
                  backgroundColor: Colors.grey[100],
                  onChanged: _filterStudents,
                ),
              ),
              
              // Grade Filter - لم يتم تغييره
              Container(
                height: 60,
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 8),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  children: ['all', '10', '11', '12'].map((grade) {
                    final isSelected = grade == _selectedGrade;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedGrade = grade;
                          _filterStudents(_searchController.text);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 8),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Color(0xFF7C3AED)
                              : Colors.grey[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            grade == 'all' ? 'الكل' : 'الصف $grade',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              
              // Stats - لم يتم تغييره
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StatsItemStudents(
                      label: 'الطلاب',
                      value: '1,245',
                      color: Colors.blue,
                    ),
                    StatsItemStudents(
                      label: 'نشط',
                      value: '1,200',
                      color: Colors.green,
                    ),
                    StatsItemStudents(
                      label: 'متخرج',
                      value: '45',
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
              
              // Students List - لم يتم تغييره
              Expanded(
                child: _filteredStudents.isEmpty
                    ? EmptyStudentsWidget()
                    : ListView.builder(
                        padding: EdgeInsets.all(16),
                        itemCount: _filteredStudents.length,
                        itemBuilder: (context, index) {
                          final student = _filteredStudents[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(16),
                              leading: CircleAvatar(
                                radius: 28,
                                backgroundColor: Color(0xFF7C3AED).withOpacity(0.1),
                                child: Text(
                                  student.name[0],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF7C3AED),
                                  ),
                                ),
                              ),
                              title: Text(
                                student.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 4),
                                  Text('رقم: ${student.studentId}'),
                                  Text('الصف ${student.grade}-${student.section}'),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          'GPA: ${student.gpa}',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          'حضور: ${student.attendanceRate?.toStringAsFixed(0)}%',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: PopupMenuButton(
                                icon: Icon(Icons.more_vert),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 'view',
                                    child: Text('عرض التفاصيل'),
                                  ),
                                  PopupMenuItem(
                                    value: 'edit',
                                    child: Text('تعديل'),
                                  ),
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: Text('حذف'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
