import 'package:edugate/core/widgets/common/app_text_form_field.dart';
import 'package:edugate/features/send_notifications/ui/ection_card.dart';
import 'package:edugate/features/send_notifications/ui/widgets/reciept_chip.dart';
import 'package:flutter/material.dart';

class RecipientSelectorWidget extends StatelessWidget {
  final String recipientType;
  final Set<String> selectedGrades;
  final Set<String> selectedRecipients;
  final List<Map<String, dynamic>> students;
  final List<String> grades;
  final TextEditingController searchController;
  final Function(String) onRecipientTypeChanged;
  final Function(Set<String>) onGradesChanged;
  final Function(Set<String>) onRecipientsChanged;

  const RecipientSelectorWidget({
    super.key,
    required this.recipientType,
    required this.selectedGrades,
    required this.selectedRecipients,
    required this.students,
    required this.grades,
    required this.searchController,
    required this.onRecipientTypeChanged,
    required this.onGradesChanged,
    required this.onRecipientsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'المستلمون',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: RecipientChip(
                  label: 'الكل',
                  icon: Icons.group,
                  value: 'all',
                  groupValue: recipientType,
                  onTap: () => onRecipientTypeChanged('all'),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: RecipientChip(
                  label: 'حسب الصف',
                  icon: Icons.class_,
                  value: 'grade',
                  groupValue: recipientType,
                  onTap: () => onRecipientTypeChanged('grade'),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: RecipientChip(
                  label: 'مخصص',
                  icon: Icons.person,
                  value: 'custom',
                  groupValue: recipientType,
                  onTap: () => onRecipientTypeChanged('custom'),
                ),
              ),
            ],
          ),
          if (recipientType == 'grade') _buildGradeSelector(),
          if (recipientType == 'custom') _buildCustomSelector(),
          SizedBox(height: 12),
          _buildRecipientCount(),
        ],
      ),
    );
  }

  Widget _buildGradeSelector() {
    return Column(
      children: [
        SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: grades.map((grade) {
            final isSelected = selectedGrades.contains(grade);
            return FilterChip(
              label: Text(grade),
              selected: isSelected,
              onSelected: (selected) {
                // ⭐ هنا المشكلة - لازم تبعت الـ Set الجديد للـ parent
                final newGrades = Set<String>.from(selectedGrades);
                if (selected) {
                  newGrades.add(grade);
                } else {
                  newGrades.remove(grade);
                }
                onGradesChanged(newGrades); // ✅ صح
              },
              selectedColor: Color(0xFF7C3AED),
              checkmarkColor: Colors.white,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCustomSelector() {
    return Column(
      children: [
        SizedBox(height: 16),
        UniversalFormField(
          controller: searchController,
          hintText: 'ابحث عن طالب...',
          prefixIcon: Icon(Icons.search, color: Color(0xFF7C3AED)),
        ),
        SizedBox(height: 12),
        Container(
          constraints: BoxConstraints(maxHeight: 250),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              final isSelected = selectedRecipients.contains(student['id']);

              return CheckboxListTile(
                value: isSelected,
                onChanged: (value) {
                  final newRecipients = Set<String>.from(selectedRecipients);
                  if (value!) {
                    newRecipients.add(student['id']);
                  } else {
                    newRecipients.remove(student['id']);
                  }
                  onRecipientsChanged(newRecipients);
                },
                title: Text(student['name']),
                subtitle: Text('${student['grade']} - ولي الأمر: ${student['parent']}'),
                secondary: CircleAvatar(
                  backgroundColor: Color(0xFF7C3AED).withOpacity(0.1),
                  child: Text(
                    student['name'][0],
                    style: TextStyle(
                      color: Color(0xFF7C3AED),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                activeColor: Color(0xFF7C3AED),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecipientCount() {
    String message;
    if (recipientType == 'all') {
      message = 'سيتم الإرسال إلى جميع أولياء الأمور (${students.length} ولي أمر)';
    } else if (recipientType == 'grade') {
      final count =
          students.where((s) => selectedGrades.contains(s['grade'])).length;
      message = 'عدد المستلمين: $count ولي أمر';
    } else {
      message = 'عدد المستلمين المختارين: ${selectedRecipients.length}';
    }

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.info, color: Colors.blue, size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(fontSize: 14, color: Colors.blue[900]),
            ),
          ),
        ],
      ),
    );
  }
}
