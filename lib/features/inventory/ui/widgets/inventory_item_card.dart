import 'package:edugate/core/widgets/common/app_text_button.dart';
import 'package:edugate/features/inventory/data/inventory_item_model.dart';
import 'package:flutter/material.dart';

class InventoryItemWidget extends StatelessWidget {
  final InventoryItemModel item;
  final VoidCallback onUpdate;
  final VoidCallback onDelete;

  const InventoryItemWidget({
    super.key,
    required this.item,
    required this.onUpdate,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: item.isLowStock ? Colors.red.withOpacity(0.3) : Colors.grey[200]!,
          width: item.isLowStock ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.inventory, color: Colors.blue, size: 28),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 2),
                    Text('كود: ${item.id}',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ],
                ),
              ),
              if (item.isLowStock)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.red.withOpacity(0.3)),
                  ),
                  child: Text('ناقص',
                      style: TextStyle(
                          fontSize: 11, color: Colors.red, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                  child: _ItemInfo(
                      label: 'الكمية', value: '${item.quantity}', color: Colors.green)),
              Expanded(
                  child: _ItemInfo(
                      label: 'السعر', value: '${item.price.toInt()} ج.م', color: Colors.blue)),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: AppTextButton(
                  buttonText: 'تحديث',
                  icon: Icons.edit,
                  textStyle: TextStyle(fontSize: 14, color: Color(0xFF7C3AED)),
                  backgroundColor: Colors.white,
                  // borderColor: Color(0xFF7C3AED),
                  buttonHeight: 40,
                  borderRadius: 10,
                  onPressed: onUpdate,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: AppTextButton(
                  buttonText: 'حذف',
                  icon: Icons.delete,
                  textStyle: TextStyle(fontSize: 14, color: Colors.red),
                  backgroundColor: Colors.white,
                  // borderColor: Colors.red,
                  buttonHeight: 40,
                  borderRadius: 10,
                  onPressed: onDelete,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ItemInfo extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ItemInfo({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        SizedBox(height: 4),
        Text(value,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color)),
      ],
    );
  }
}
