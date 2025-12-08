import 'package:edugate/features/inventory/data/inventory_item_model.dart';
import 'package:edugate/features/inventory/ui/widgets/add_inventory_dialog.dart';
import 'package:edugate/features/inventory/ui/widgets/delete_confirm_dialouge.dart';
import 'package:edugate/features/inventory/ui/widgets/inventory_empty.dart';
import 'package:edugate/features/inventory/ui/widgets/inventory_item_card.dart';
import 'package:edugate/features/inventory/ui/widgets/inventory_search_filter.dart';
import 'package:edugate/features/inventory/ui/widgets/inventory_stats_cards.dart';
import 'package:edugate/features/inventory/ui/widgets/update_quantity.dart';
import 'package:flutter/material.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  String _selectedCategory = 'all';
  final _searchController = TextEditingController();
  List<InventoryItemModel> _items = [];

  @override
  void initState() {
    super.initState();
    _items = InventoryDummyData.getAllItems();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<InventoryItemModel> get _filteredItems {
    var filtered = _selectedCategory == 'all'
        ? _items
        : _items.where((item) => item.category == _selectedCategory).toList();

    final query = _searchController.text.toLowerCase();
    if (query.isNotEmpty) {
      filtered = filtered
          .where(
            (item) =>
                item.name.toLowerCase().contains(query) ||
                item.id.toLowerCase().contains(query),
          )
          .toList();
    }
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Color(0xFF7C3AED),
        elevation: 0,
        title: Text(
          'إدارة المخزون',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddItemDialog(),
        icon: Icon(Icons.add),
        label: Text('إضافة صنف'),
        backgroundColor: Color(0xFF7C3AED),
      ),
      body: Column(
        children: [
          InventoryStatsWidget(items: _items),
          InventorySearchFilterWidget(
            searchController: _searchController,
            selectedCategory: _selectedCategory,
            onSearchChanged: () => setState(() {}),
            onCategoryChanged: (cat) => setState(() => _selectedCategory = cat),
          ),
          Expanded(
            child: _filteredItems.isEmpty
                ? InventoryEmptyState()
                : ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      return InventoryItemWidget(
                        item: _filteredItems[index],
                        onUpdate: () => _updateItem(_filteredItems[index]),
                        onDelete: () => _deleteItem(_filteredItems[index].id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (context) => AddInventoryDialogWidget(
        onAdd: (item) {
          setState(() => _items.add(item));
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم إضافة الصنف'),
              backgroundColor: Colors.green,
            ),
          );
        },
      ),
    );
  }

  void _updateItem(InventoryItemModel item) {
    final controller = TextEditingController(text: item.quantity.toString());

    showDialog(
      context: context,
      builder: (context) => UpdateQuantityDialog(
        item: item,
        controller: controller,
        onUpdate: (newQty) {
          setState(() {
            final index = _items.indexWhere((i) => i.id == item.id);
            _items[index] = item.copyWith(
              quantity: newQty,
              lastUpdate: DateTime.now(),
            );
          });
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم التحديث'),
              backgroundColor: Colors.green,
            ),
          );
        },
      ),
    );
  }

  void _deleteItem(String id) {
    showDialog(
      context: context,
      builder: (context) => DeleteConfirmDialog(
        onConfirm: () {
          setState(() => _items.removeWhere((item) => item.id == id));
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('تم الحذف'), backgroundColor: Colors.red),
          );
        },
      ),
    );
  }
}
