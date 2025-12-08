import 'package:edugate/core/helper/responsive_helper.dart';
import 'package:edugate/core/widgets/common/app_text_button.dart';
import 'package:edugate/core/widgets/common/app_text_form_field.dart';
import 'package:edugate/features/record_payment/ui/widgets/payment_type_chip.dart';
import 'package:edugate/features/record_payment/ui/widgets/reciept_dialouge.dart';
import 'package:edugate/features/record_payment/ui/widgets/section_title.dart';
import 'package:edugate/features/record_payment/ui/widgets/student_info_card.dart';
import 'package:edugate/features/record_payment/ui/widgets/student_search_result_title.dart';
import 'package:flutter/material.dart';

class RecordPaymentScreen extends StatefulWidget {
  const RecordPaymentScreen({super.key});

  @override
  State<RecordPaymentScreen> createState() => _RecordPaymentScreenState();
}

class _RecordPaymentScreenState extends State<RecordPaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();

  String _paymentType = 'tuition';
  String _paymentMethod = 'cash';
  String? _selectedStudent;

  final List<Map<String, dynamic>> _students = [
    {
      'id': 'S001',
      'name': 'أحمد محمد علي',
      'grade': 'الصف الأول',
      'balance': 12000.0,
      'totalFees': 15000.0,
    },
    {
      'id': 'S002',
      'name': 'فاطمة حسن محمود',
      'grade': 'الصف الثاني',
      'balance': 8500.0,
      'totalFees': 15000.0,
    },
    {
      'id': 'S003',
      'name': 'محمود سعيد أحمد',
      'grade': 'الصف الثالث',
      'balance': 0.0,
      'totalFees': 15000.0,
    },
  ];

  List<Map<String, dynamic>> _filteredStudents = [];

  @override
  void initState() {
    super.initState();
    _filteredStudents = _students;
  }

  void _filterStudents(String query) {
    setState(() {
      _filteredStudents = _students.where((student) {
        return student['name'].toString().toLowerCase().contains(
              query.toLowerCase(),
            ) ||
            student['id'].toString().toLowerCase().contains(
              query.toLowerCase(),
            );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);
    final selectedStudentData = _selectedStudent != null
        ? _students.firstWhere((s) => s['id'] == _selectedStudent)
        : null;

    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Color(0xFF7C3AED),
        elevation: 0,
        title: Text(
          'تسجيل دفعة مصروفات',
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
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isDesktop ? 32 : 16),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: isDesktop ? 800 : double.infinity,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(title: 'بحث عن الطالب'),
                  SizedBox(height: 16),

                  // Search Field ⭐
                  UniversalFormField(
                    controller: _searchController,
                    hintText: 'ابحث بالاسم أو رقم الطالب...',
                    prefixIcon: Icon(Icons.search, color: Color(0xFF7C3AED)),
                    onChanged: _filterStudents,
                  ),

                  SizedBox(height: 16),
                  if (_searchController.text.isNotEmpty &&
                      _filteredStudents.isNotEmpty)
                    Container(
                      constraints: BoxConstraints(maxHeight: 300),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _filteredStudents.length,
                        itemBuilder: (context, index) {
                          final student = _filteredStudents[index];
                          final isSelected = _selectedStudent == student['id'];

                          return StudentSearchResultTile(
                            student: student,
                            isSelected: isSelected,
                            onTap: () {
                              setState(() {
                                _selectedStudent = student['id'];
                                _searchController.clear();
                              });
                            },
                          );
                        },
                      ),
                    ),
                  if (selectedStudentData != null) ...[
                    SizedBox(height: 24),
                    StudentInfoCard(student: selectedStudentData),
                    SizedBox(height: 24),
                    SectionTitle(title: 'تفاصيل الدفعة'),
                    SizedBox(height: 16),
                    _buildPaymentTypeSelector(),
                    SizedBox(height: 16),

                    // Amount Field ⭐
                    UniversalFormField(
                      controller: _amountController,
                      hintText: 'المبلغ المدفوع',
                      prefixIcon: Icon(
                        Icons.payments,
                        color: Color(0xFF7C3AED),
                      ),
                      suffixText: 'ج.م',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value?.isEmpty ?? true) return 'مطلوب';
                        final amount = double.tryParse(value!);
                        if (amount == null || amount <= 0) {
                          return 'المبلغ غير صحيح';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 16),
                    _buildPaymentMethodSelector(),
                    SizedBox(height: 16),

                    // Notes Field ⭐
                    UniversalFormField(
                      controller: _notesController,
                      hintText: 'ملاحظات (اختياري)',
                      prefixIcon: Icon(Icons.note, color: Color(0xFF7C3AED)),
                      maxLines: 3,
                    ),

                    SizedBox(height: 32),

                    // Submit Button ⭐
                    AppTextButton(
                      buttonText: 'تأكيد الدفع وطباعة الإيصال',
                      icon: Icons.check_circle,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      backgroundColor: Color(0xFF7C3AED),
                      buttonHeight: 56,
                      borderRadius: 12,
                      onPressed: _submitPayment,
                    ),
                  ],
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentTypeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نوع الدفعة',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: PaymentTypeChip(
                label: 'مصروفات دراسية',
                value: 'tuition',
                groupValue: _paymentType,
                onTap: () => setState(() => _paymentType = 'tuition'),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: PaymentTypeChip(
                label: 'رسوم نقل',
                value: 'transport',
                groupValue: _paymentType,
                onTap: () => setState(() => _paymentType = 'transport'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentMethodSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'طريقة الدفع',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: PaymentTypeChip(
                label: 'نقدي',
                value: 'cash',
                groupValue: _paymentMethod,
                icon: Icons.money,
                onTap: () => setState(() => _paymentMethod = 'cash'),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: PaymentTypeChip(
                label: 'تحويل بنكي',
                value: 'bank',
                groupValue: _paymentMethod,
                icon: Icons.account_balance,
                onTap: () => setState(() => _paymentMethod = 'bank'),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: PaymentTypeChip(
                label: 'محفظة',
                value: 'wallet',
                groupValue: _paymentMethod,
                icon: Icons.wallet,
                onTap: () => setState(() => _paymentMethod = 'wallet'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _submitPayment() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => ReceiptDialog(
          studentName: _students.firstWhere(
            (s) => s['id'] == _selectedStudent,
          )['name'],
          amount: _amountController.text,
          paymentType: _paymentType == 'tuition'
              ? 'مصروفات دراسية'
              : 'رسوم نقل',
          paymentMethod: _getPaymentMethodLabel(_paymentMethod),
        ),
      );
    }
  }

  String _getPaymentMethodLabel(String method) {
    switch (method) {
      case 'cash':
        return 'نقدي';
      case 'bank':
        return 'تحويل بنكي';
      case 'wallet':
        return 'محفظة إلكترونية';
      default:
        return method;
    }
  }
}





