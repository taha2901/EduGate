import 'package:edugate/core/widgets/common/app_text_button.dart';
import 'package:edugate/core/widgets/common/app_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../data/inventory_item_model.dart';

class UpdateQuantityDialog extends StatelessWidget {
  final InventoryItemModel item;
  final TextEditingController controller;
  final Function(int) onUpdate;

  const UpdateQuantityDialog({
    super.key,
    required this.item,
    required this.controller,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Row(
        children: [
          Icon(Icons.edit, color: Color(0xFF7C3AED)),
          SizedBox(width: 12),
          Text('تحديث الكمية'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          UniversalFormField(
            controller: controller,
            hintText: 'الكمية الجديدة',
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('إلغاء')),
        AppTextButton(
          buttonText: 'حفظ',
          textStyle: TextStyle(fontSize: 14, color: Colors.white),
          backgroundColor: Color(0xFF7C3AED),
          buttonHeight: 40,
          buttonWidth: 80,
          borderRadius: 8,
          onPressed: () {
            final newQty = int.tryParse(controller.text);
            if (newQty != null) onUpdate(newQty);
          },
        ),
      ],
    );
  }
}
