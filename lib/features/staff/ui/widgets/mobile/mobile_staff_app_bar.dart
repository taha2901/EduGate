// features/admin/staff/ui/widgets/mobile/mobile_staff_app_bar.dart
import 'package:flutter/material.dart';

class MobileStaffAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBack;
  final VoidCallback onFilter;

  const MobileStaffAppBar({
    Key? key,
    required this.onBack,
    required this.onFilter,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF7C3AED),
      elevation: 0,
      title: Text(
        'إدارة الموظفين',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: onBack,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.filter_list, color: Colors.white),
          onPressed: onFilter,
        ),
      ],
    );
  }
}
