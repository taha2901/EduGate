import 'package:edugate/core/helper/responsive_helper.dart';
import 'package:edugate/core/widgets/common/app_text_button.dart';
import 'package:edugate/features/send_notifications/ui/widgets/basic_info.dart';
import 'package:edugate/features/send_notifications/ui/widgets/delivery_option.dart';
import 'package:edugate/features/send_notifications/ui/widgets/notification_type_selectors.dart';
import 'package:edugate/features/send_notifications/ui/widgets/preview.dart';
import 'package:edugate/features/send_notifications/ui/widgets/reciept_selector.dart';
import 'package:edugate/features/send_notifications/ui/widgets/schedule_option.dart';
import 'package:edugate/features/send_notifications/ui/widgets/success_dialouge.dart';
import 'package:flutter/material.dart';

class SendNotificationScreen extends StatefulWidget {
  const SendNotificationScreen({super.key});

  @override
  State<SendNotificationScreen> createState() => _SendNotificationScreenState();
}

class _SendNotificationScreenState extends State<SendNotificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();
  final _searchController = TextEditingController();

  String _recipientType = 'all';
  String _notificationType = 'general';
  bool _sendSMS = false;
  bool _sendEmail = false;
  DateTime? _scheduledDate;
  TimeOfDay? _scheduledTime;

  Set<String> _selectedRecipients = {};
  Set<String> _selectedGrades = {};

  final List<Map<String, dynamic>> _students = [
    {
      'id': 'S001',
      'name': 'أحمد محمد علي',
      'grade': 'الصف الأول',
      'parent': 'محمد علي',
    },
    {
      'id': 'S002',
      'name': 'فاطمة حسن',
      'grade': 'الصف الثاني',
      'parent': 'حسن محمود',
    },
    {
      'id': 'S003',
      'name': 'محمود سعيد',
      'grade': 'الصف الأول',
      'parent': 'سعيد أحمد',
    },
    {
      'id': 'S004',
      'name': 'سارة خالد',
      'grade': 'الصف الثالث',
      'parent': 'خالد إبراهيم',
    },
  ];

  final List<String> _grades = ['الصف الأول', 'الصف الثاني', 'الصف الثالث'];

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    _searchController.dispose();
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
          'إرسال إشعار',
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
        child: isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
      ),
    );
  }

  // ===== Mobile Layout =====
  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NotificationTypeSelectorWidget(
            notificationType: _notificationType,
            onChanged: (value) => setState(() => _notificationType = value),
          ),
          SizedBox(height: 20),
          BasicInfoWidget(
            titleController: _titleController,
            messageController: _messageController,
          ),
          SizedBox(height: 20),
          RecipientSelectorWidget(
            recipientType: _recipientType,
            selectedGrades: _selectedGrades,
            selectedRecipients: _selectedRecipients,
            students: _students,
            grades: _grades,
            searchController: _searchController,
            onRecipientTypeChanged: (value) =>
                setState(() => _recipientType = value),
            onGradesChanged: (grades) =>
                setState(() => _selectedGrades = grades),
            onRecipientsChanged: (recipients) =>
                setState(() => _selectedRecipients = recipients),
          ),
          SizedBox(height: 20),
          DeliveryOptionsWidget(
            sendSMS: _sendSMS,
            sendEmail: _sendEmail,
            onSMSChanged: (value) => setState(() => _sendSMS = value),
            onEmailChanged: (value) => setState(() => _sendEmail = value),
          ),

          SizedBox(height: 20),
          PreviewWidget(
            titleController: _titleController,
            messageController: _messageController,
            notificationType: _notificationType,
          ),
          SizedBox(height: 24),
          AppTextButton(
            buttonText: _scheduledDate != null
                ? 'جدولة الإرسال'
                : 'إرسال الإشعار الآن',
            icon: _scheduledDate != null ? Icons.schedule_send : Icons.send,
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            backgroundColor: Color(0xFF7C3AED),
            buttonHeight: 56,
            borderRadius: 12,
            onPressed: _sendNotification,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  // ===== Desktop Layout =====
  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NotificationTypeSelectorWidget(
                  notificationType: _notificationType,
                  onChanged: (value) =>
                      setState(() => _notificationType = value),
                ),
                SizedBox(height: 24),
                BasicInfoWidget(
                  titleController: _titleController,
                  messageController: _messageController,
                ),
                SizedBox(height: 24),
                RecipientSelectorWidget(
                  recipientType: _recipientType,
                  selectedGrades: _selectedGrades,
                  selectedRecipients: _selectedRecipients,
                  students: _students,
                  grades: _grades,
                  searchController: _searchController,
                  onRecipientTypeChanged: (value) =>
                      setState(() => _recipientType = value),
                  onGradesChanged: (grades) =>
                      setState(() => _selectedGrades = grades),
                  onRecipientsChanged: (recipients) =>
                      setState(() => _selectedRecipients = recipients),
                ),
                SizedBox(height: 24),
                DeliveryOptionsWidget(
                  sendSMS: _sendSMS,
                  sendEmail: _sendEmail,
                  onSMSChanged: (value) => setState(() => _sendSMS = value),
                  onEmailChanged: (value) => setState(() => _sendEmail = value),
                ),

                SizedBox(height: 32),
                AppTextButton(
                  buttonText: _scheduledDate != null
                      ? 'جدولة الإرسال'
                      : 'إرسال الإشعار الآن',
                  icon: _scheduledDate != null
                      ? Icons.schedule_send
                      : Icons.send,
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF7C3AED),
                  buttonHeight: 56,
                  borderRadius: 12,
                  onPressed: _sendNotification,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 400,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF7C3AED),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.visibility, color: Colors.white),
                    SizedBox(width: 12),
                    Text(
                      'معاينة الإشعار',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: PreviewWidget(
                    titleController: _titleController,
                    messageController: _messageController,
                    notificationType: _notificationType,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

 
  void _sendNotification() {
    if (_formKey.currentState!.validate()) {
      if (_recipientType == 'grade' && _selectedGrades.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('يرجى اختيار صف واحد على الأقل'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (_recipientType == 'custom' && _selectedRecipients.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('يرجى اختيار مستلم واحد على الأقل'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      showDialog(
        context: context,
        builder: (context) => SuccessDialog(
          scheduled: _scheduledDate != null,
          scheduleTime: _scheduledDate != null && _scheduledTime != null
              ? '${_scheduledDate!.day}/${_scheduledDate!.month}/${_scheduledDate!.year} - ${_scheduledTime!.format(context)}'
              : null,
        ),
      );
    }
  }
}
