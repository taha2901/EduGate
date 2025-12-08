import 'package:edugate/core/helper/responsive_helper.dart';
import 'package:edugate/features/students/ui/widgets/financial_info_step.dart';
import 'package:edugate/features/students/ui/widgets/navigation_buttons.dart';
import 'package:edugate/features/students/ui/widgets/parent_info_step.dart';
import 'package:edugate/features/students/ui/widgets/step_indicator.dart';
import 'package:edugate/features/students/ui/widgets/student_info_step.dart';
import 'package:flutter/material.dart';

class StudentRegistrationScreen extends StatefulWidget {
  const StudentRegistrationScreen({super.key});

  @override
  State<StudentRegistrationScreen> createState() => _StudentRegistrationScreenState();
}

class _StudentRegistrationScreenState extends State<StudentRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  // Student Info Controllers
  final _nameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _nationalIdController = TextEditingController();
  final _addressController = TextEditingController();
  String _selectedGrade = '1';
  String _selectedGender = 'male';

  // Parent Info Controllers
  final _parentNameController = TextEditingController();
  final _parentPhoneController = TextEditingController();
  final _parentEmailController = TextEditingController();
  final _parentJobController = TextEditingController();
  final _parentAddressController = TextEditingController();

  // Financial Info Controllers
  String _paymentPlan = 'full';
  final _tuitionController = TextEditingController(text: '15000');
  final _discountController = TextEditingController(text: '0');
  bool _needsTransportation = false;
  final _transportFeeController = TextEditingController(text: '1500');

  @override
  void dispose() {
    _nameController.dispose();
    _birthDateController.dispose();
    _nationalIdController.dispose();
    _addressController.dispose();
    _parentNameController.dispose();
    _parentPhoneController.dispose();
    _parentEmailController.dispose();
    _parentJobController.dispose();
    _parentAddressController.dispose();
    _tuitionController.dispose();
    _discountController.dispose();
    _transportFeeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Color(0xFF7C3AED),
        elevation: 0,
        title: Text(
          'تسجيل طالب جديد',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            StepIndicator(currentStep: _currentStep),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(isDesktop ? 32 : 16),
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: isDesktop ? 800 : double.infinity,
                    ),
                    child: _buildCurrentStep(),
                  ),
                ),
              ),
            ),
            NavigationButtons(
              currentStep: _currentStep,
              onPrevious: () => setState(() => _currentStep--),
              onNext: _handleNext,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (_currentStep) {
      case 0:
        return StudentInfoStep(
          nameController: _nameController,
          birthDateController: _birthDateController,
          nationalIdController: _nationalIdController,
          addressController: _addressController,
          selectedGrade: _selectedGrade,
          selectedGender: _selectedGender,
          onGradeChanged: (value) => setState(() => _selectedGrade = value),
          onGenderChanged: (value) => setState(() => _selectedGender = value),
        );
      case 1:
        return ParentInfoStep(
          nameController: _parentNameController,
          phoneController: _parentPhoneController,
          emailController: _parentEmailController,
          jobController: _parentJobController,
          addressController: _parentAddressController,
        );
      case 2:
        return FinancialInfoStep(
          tuitionController: _tuitionController,
          discountController: _discountController,
          transportFeeController: _transportFeeController,
          paymentPlan: _paymentPlan,
          needsTransportation: _needsTransportation,
          onPaymentPlanChanged: (value) => setState(() => _paymentPlan = value),
          onTransportationChanged: (value) => setState(() => _needsTransportation = value),
        );
      default:
        return SizedBox.shrink();
    }
  }

  void _handleNext() {
    if (_currentStep < 2) {
      if (_formKey.currentState!.validate()) {
        setState(() => _currentStep++);
      }
    } else {
      _submitRegistration();
    }
  }

  void _submitRegistration() {
    if (!_formKey.currentState!.validate()) return;

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 12),
            Text('تم تسجيل الطالب بنجاح'),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // Navigate back
    Navigator.pop(context);
  }
}
