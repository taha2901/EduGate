import 'package:edugate/core/widgets/common/app_text_form_field.dart';
import 'package:flutter/material.dart';

class InventorySearchFilterWidget extends StatelessWidget {
  final TextEditingController searchController;
  final String selectedCategory;
  final VoidCallback onSearchChanged;
  final Function(String) onCategoryChanged;

  const InventorySearchFilterWidget({
    super.key,
    required this.searchController,
    required this.selectedCategory,
    required this.onSearchChanged,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          UniversalFormField(
            controller: searchController,
            hintText: 'ابحث عن صنف...',
            prefixIcon: Icon(Icons.search, color: Color(0xFF7C3AED)),
            onChanged: (_) => onSearchChanged(),
          ),
          SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _CategoryChip(
                  label: 'الكل',
                  icon: Icons.apps,
                  value: 'all',
                  isSelected: selectedCategory == 'all',
                  onTap: () => onCategoryChanged('all'),
                ),
                SizedBox(width: 8),
                _CategoryChip(
                  label: 'أدوات مكتبية',
                  icon: Icons.edit,
                  value: 'stationery',
                  isSelected: selectedCategory == 'stationery',
                  onTap: () => onCategoryChanged('stationery'),
                ),
                SizedBox(width: 8),
                _CategoryChip(
                  label: 'كتب',
                  icon: Icons.book,
                  value: 'books',
                  isSelected: selectedCategory == 'books',
                  onTap: () => onCategoryChanged('books'),
                ),
                SizedBox(width: 8),
                _CategoryChip(
                  label: 'زي مدرسي',
                  icon: Icons.checkroom,
                  value: 'uniform',
                  isSelected: selectedCategory == 'uniform',
                  onTap: () => onCategoryChanged('uniform'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final String value;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.icon,
    required this.value,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = _getCategoryColor(value);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? color : Colors.grey[300]!,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: isSelected ? Colors.white : Colors.grey[700]),
            SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.white : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getCategoryColor(String cat) {
    switch (cat) {
      case 'stationery':
        return Colors.blue;
      case 'books':
        return Colors.purple;
      case 'uniform':
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }
}
