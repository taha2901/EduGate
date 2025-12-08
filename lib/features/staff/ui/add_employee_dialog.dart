import 'package:edugate/core/widgets/common/app_text_button.dart';
import 'package:edugate/features/staff/ui/widgets/add_employee/basic_info_section.dart';
import 'package:edugate/features/staff/ui/widgets/add_employee/emploee_type_selector.dart';
import 'package:edugate/features/staff/ui/widgets/add_employee/teacher_info_section.dart';
import 'package:edugate/features/staff/ui/widgets/add_employee/staff_info_section.dart';
import 'package:edugate/features/staff/ui/widgets/add_employee/additional_info_section.dart';
import 'package:edugate/features/staff/ui/widgets/add_employee/dialog_header.dart';
import 'package:edugate/features/staff/ui/widgets/add_employee/dialog_footer.dart';
import 'package:flutter/material.dart';

class AddEmployeeDialog extends StatefulWidget {
  const AddEmployeeDialog({super.key});

  @override
  State<AddEmployeeDialog> createState() => _AddEmployeeDialogState();
}

class _AddEmployeeDialogState extends State<AddEmployeeDialog> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // Employee Type
  String _employeeType = 'teacher';

  // Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _employeeIdController = TextEditingController();
  final _salaryController = TextEditingController();
  final _nationalIdController = TextEditingController();
  final _addressController = TextEditingController();

  // Teacher-specific
  String? _selectedDepartment;
  List<String> _selectedSubjects = [];

  // Staff-specific
  String? _selectedPosition;
  String? _selectedShift;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _employeeIdController.dispose();
    _salaryController.dispose();
    _nationalIdController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _handleEmployeeTypeChange(String type) {
    setState(() {
      _employeeType = type;
      // Reset specific fields when type changes
      _selectedDepartment = null;
      _selectedSubjects.clear();
      _selectedPosition = null;
      _selectedShift = null;
    });
  }

  void _handleSubjectToggle(String subject) {
    setState(() {
      if (_selectedSubjects.contains(subject)) {
        _selectedSubjects.remove(subject);
      } else {
        _selectedSubjects.add(subject);
      }
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Validate teacher-specific fields
      if (_employeeType == 'teacher' && _selectedSubjects.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.error, color: Colors.white),
                SizedBox(width: 12),
                Text('يرجى اختيار مادة واحدة على الأقل'),
              ],
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      setState(() => _isLoading = true);

      // Simulate API call
      Future.delayed(Duration(seconds: 2), () {
        setState(() => _isLoading = false);
        Navigator.pop(context);
        _showSuccessDialog();
      });
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 80),
              SizedBox(height: 24),
              Text(
                'تمت الإضافة بنجاح!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'تم إضافة الموظف الجديد بنجاح',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: AppTextButton(
                  buttonText: 'تم',
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF7C3AED),
                  borderRadius: 12,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 800,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DialogHeader(title: 'إضافة موظف جديد'),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Employee Type Selector
                      EmployeeTypeSelector(
                        selectedType: _employeeType,
                        onTypeChanged: _handleEmployeeTypeChange,
                      ),
                      SizedBox(height: 24),

                      // Basic Info
                      BasicInfoSection(
                        nameController: _nameController,
                        employeeIdController: _employeeIdController,
                        phoneController: _phoneController,
                        emailController: _emailController,
                        salaryController: _salaryController,
                      ),
                      SizedBox(height: 24),

                      // Conditional Sections
                      if (_employeeType == 'teacher')
                        TeacherInfoSection(
                          selectedDepartment: _selectedDepartment,
                          selectedSubjects: _selectedSubjects,
                          onDepartmentChanged: (value) {
                            setState(() => _selectedDepartment = value);
                          },
                          onSubjectToggle: _handleSubjectToggle,
                        )
                      else
                        StaffInfoSection(
                          employeeType: _employeeType,
                          selectedPosition: _selectedPosition,
                          selectedShift: _selectedShift,
                          onPositionChanged: (value) {
                            setState(() => _selectedPosition = value);
                          },
                          onShiftChanged: (value) {
                            setState(() => _selectedShift = value);
                          },
                        ),
                      SizedBox(height: 24),

                      // Additional Info
                      AdditionalInfoSection(
                        nationalIdController: _nationalIdController,
                        addressController: _addressController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            DialogFooter(
              onCancel: () => Navigator.pop(context),
              onSubmit: _submitForm,
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
