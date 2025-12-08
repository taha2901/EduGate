import 'package:edugate/core/widgets/common/app_text_button.dart';
import 'package:edugate/core/widgets/common/app_text_form_field.dart';
import 'package:edugate/features/announcements/ui/widgets/announcement_helpers.dart';
import 'package:flutter/material.dart';

class CreateAnnouncementSheet extends StatefulWidget {
  final VoidCallback onAnnouncementCreated;

  const CreateAnnouncementSheet({
    super.key,
    required this.onAnnouncementCreated,
  });

  @override
  State<CreateAnnouncementSheet> createState() =>
      _CreateAnnouncementSheetState();
}

class _CreateAnnouncementSheetState extends State<CreateAnnouncementSheet> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _expiryDateController = TextEditingController();

  String _selectedPriority = 'medium';
  String _selectedTarget = 'all';
  bool _isPinned = false;
  DateTime? _expiryDate;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _expiryDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF7C3AED),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.announcement, color: Colors.white, size: 28),
                  SizedBox(width: 12),
                  Text(
                    'إنشاء إعلان جديد',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            // Form Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title Field ⭐
                    UniversalFormField(
                      controller: _titleController,
                      hintText: 'عنوان الإعلان',
                      prefixIcon: Icon(Icons.title, color: Color(0xFF7C3AED)),
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'الرجاء إدخال العنوان' : null,
                    ),
                    SizedBox(height: 16),

                    // Content Field ⭐
                    UniversalFormField(
                      controller: _contentController,
                      hintText: 'محتوى الإعلان',
                      prefixIcon: Icon(Icons.description, color: Color(0xFF7C3AED)),
                      maxLines: 5,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'الرجاء إدخال المحتوى' : null,
                    ),
                    SizedBox(height: 16),

                    // Priority Dropdown ⭐
                    UniversalFormField(
                      hintText: 'الأولوية',
                      prefixIcon: Icon(
                        AnnouncementHelpers.getPriorityIcon(_selectedPriority),
                        color: AnnouncementHelpers.getPriorityColor(_selectedPriority),
                      ),
                      hasDropdown: true,
                      dropdownItems: ['urgent', 'high', 'medium', 'low'],
                      dropdownItemLabels: {
                        'urgent': 'عاجل',
                        'high': 'مهم',
                        'medium': 'متوسط',
                        'low': 'عادي',
                      },
                      initialDropdownValue: _selectedPriority,
                      onDropdownChanged: (value) {
                        setState(() => _selectedPriority = value!);
                      },
                    ),
                    SizedBox(height: 16),

                    // Target Audience Dropdown ⭐
                    UniversalFormField(
                      hintText: 'الجمهور المستهدف',
                      prefixIcon: Icon(
                        AnnouncementHelpers.getTargetIcon(_selectedTarget),
                        color: Color(0xFF7C3AED),
                      ),
                      hasDropdown: true,
                      dropdownItems: ['all', 'students', 'teachers', 'parents'],
                      dropdownItemLabels: {
                        'all': 'الجميع',
                        'students': 'الطلاب',
                        'teachers': 'المعلمين',
                        'parents': 'أولياء الأمور',
                      },
                      initialDropdownValue: _selectedTarget,
                      onDropdownChanged: (value) {
                        setState(() => _selectedTarget = value!);
                      },
                    ),
                    SizedBox(height: 16),

                    // Expiry Date Picker ⭐
                    UniversalFormField(
                      controller: _expiryDateController,
                      hintText: 'تاريخ الانتهاء (اختياري)',
                      prefixIcon: Icon(Icons.calendar_today, color: Color(0xFF7C3AED)),
                      isDatePicker: true,
                      dateFormat: 'dd/MM/yyyy',
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                      onDateSelected: (date) {
                        setState(() => _expiryDate = date);
                      },
                    ),
                    SizedBox(height: 16),

                    // Pin Toggle
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SwitchListTile(
                        title: Text('تثبيت الإعلان'),
                        subtitle: Text(
                          'سيظهر الإعلان في أعلى القائمة',
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        secondary: Icon(
                          Icons.push_pin,
                          color: _isPinned ? Colors.orange : Colors.grey,
                        ),
                        value: _isPinned,
                        onChanged: (value) => setState(() => _isPinned = value),
                        activeColor: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Submit Button ⭐
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: AppTextButton(
                buttonText: 'نشر الإعلان',
                buttonWidth:  double.infinity,
                icon: Icons.send,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                backgroundColor: Color(0xFF7C3AED),
                buttonHeight: 52,
                borderRadius: 12,
                onPressed: _submitAnnouncement,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitAnnouncement() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
      widget.onAnnouncementCreated();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 12),
              Text('تم نشر الإعلان بنجاح'),
            ],
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }
}
