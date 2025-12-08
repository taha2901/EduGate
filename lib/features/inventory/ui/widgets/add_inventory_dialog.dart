import 'package:edugate/core/widgets/common/app_text_button.dart';
import 'package:edugate/core/widgets/common/app_text_form_field.dart';
import 'package:edugate/features/inventory/data/inventory_item_model.dart';
import 'package:flutter/material.dart';

class AddInventoryDialogWidget extends StatefulWidget {
  final Function(InventoryItemModel) onAdd;

  const AddInventoryDialogWidget({super.key, required this.onAdd});

  @override
  State<AddInventoryDialogWidget> createState() => _AddInventoryDialogWidgetState();
}

class _AddInventoryDialogWidgetState extends State<AddInventoryDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  String _selectedCategory = 'stationery';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        constraints: BoxConstraints(maxHeight: 500),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF7C3AED),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                children: [
                  Icon(Icons.add_circle, color: Colors.white, size: 28),
                  SizedBox(width: 12),
                  Text('إضافة صنف',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      UniversalFormField(
                        controller: _nameController,
                        hintText: 'اسم الصنف',
                        prefixIcon: Icon(Icons.label, color: Color(0xFF7C3AED)),
                        validator: (v) => v?.isEmpty ?? true ? 'مطلوب' : null,
                      ),
                      SizedBox(height: 16),
                      UniversalFormField(
                        controller: _quantityController,
                        hintText: 'الكمية',
                        prefixIcon: Icon(Icons.inventory, color: Colors.green),
                        keyboardType: TextInputType.number,
                        validator: (v) => v?.isEmpty ?? true ? 'مطلوب' : null,
                      ),
                      SizedBox(height: 16),
                      UniversalFormField(
                        controller: _priceController,
                        hintText: 'السعر',
                        prefixIcon: Icon(Icons.payments, color: Colors.blue),
                        keyboardType: TextInputType.number,
                        validator: (v) => v?.isEmpty ?? true ? 'مطلوب' : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: AppTextButton(
                buttonText: 'إضافة',
                icon: Icons.check,
                textStyle: TextStyle(fontSize: 16, color: Colors.white),
                backgroundColor: Color(0xFF7C3AED),
                buttonHeight: 50,
                borderRadius: 12,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final item = InventoryItemModel(
                      id: 'INV-${DateTime.now().millisecondsSinceEpoch}',
                      name: _nameController.text,
                      category: _selectedCategory,
                      quantity: int.parse(_quantityController.text),
                      minQuantity: 10,
                      unit: 'قطعة',
                      price: double.parse(_priceController.text),
                      lastUpdate: DateTime.now(),
                    );
                    widget.onAdd(item);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
