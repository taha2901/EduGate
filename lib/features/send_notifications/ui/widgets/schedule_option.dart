// import 'package:edugate/features/send_notifications/ui/ection_card.dart';
// import 'package:flutter/material.dart';

// class ScheduleOptionWidget extends StatelessWidget {
//   final DateTime? scheduledDate;
//   final TimeOfDay? scheduledTime;
//   final VoidCallback onScheduleSelected;
//   final VoidCallback onClearSchedule;

//   const ScheduleOptionWidget({super.key, 
//     required this.scheduledDate,
//     required this.scheduledTime,
//     required this.onScheduleSelected,
//     required this.onClearSchedule,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SectionCard(
//       title: 'جدولة الإرسال',
//       child: Column(
//         children: [
//           RadioListTile<bool>(
//             value: false,
//             groupValue: scheduledDate != null,
//             onChanged: (value) => onClearSchedule(),
//             title: Text('إرسال فوري'),
//             subtitle: Text('سيتم الإرسال مباشرة'),
//             activeColor: Color(0xFF7C3AED),
//           ),
//           Divider(),
//           RadioListTile<bool>(
//             value: true,
//             groupValue: scheduledDate != null,
//             onChanged: (value) => onScheduleSelected(),
//             title: Text('جدولة للإرسال لاحقاً'),
//             subtitle: scheduledDate != null
//                 ? Text(
//                     'مجدول في: ${scheduledDate!.day}/${scheduledDate!.month}/${scheduledDate!.year} - ${scheduledTime?.format(context)}',
//                   )
//                 : Text('اختر التاريخ والوقت'),
//             activeColor: Color(0xFF7C3AED),
//           ),
//         ],
//       ),
//     );
//   }
// }
