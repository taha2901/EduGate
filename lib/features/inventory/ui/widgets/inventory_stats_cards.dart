  import 'package:edugate/features/inventory/data/inventory_item_model.dart';
import 'package:flutter/material.dart';
class InventoryStatsWidget extends StatelessWidget {
final List<InventoryItemModel> items;

  const InventoryStatsWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final lowStock = items.where((item) => item.isLowStock).length;
    final totalValue = items.fold<double>(0.0, (sum, item) => sum + item.totalValue);

    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: _StatCard(
              icon: Icons.inventory,
              label: 'الأصناف',
              value: '${items.length}',
              color: Colors.blue,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _StatCard(
              icon: Icons.warning,
              label: 'قارب النفاد',
              value: '$lowStock',
              color: Colors.orange,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _StatCard(
              icon: Icons.attach_money,
              label: 'القيمة',
              value: '${totalValue.toStringAsFixed(0)}',
              color: Colors.green,
              suffix: 'ج.م',
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final String? suffix;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          SizedBox(height: 6),
          Text(value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          if (suffix != null) Text(suffix!, style: TextStyle(fontSize: 10, color: color)),
          Text(label,
              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
