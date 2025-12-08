import 'package:edugate/features/auth/ui/widgets/desktop/brand_panel.dart';
import 'package:edugate/features/auth/ui/widgets/form_panel.dart';
import 'package:flutter/material.dart';

class DesktopLogin extends StatelessWidget {
  const DesktopLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Panel - Brand
          Expanded(
            flex: 1,
            child: BrandPanel(),
          ),
          // Right Panel - Form
          Expanded(
            flex: 1,
            child: FormPanel(),
          ),
        ],
      ),
    );
  }
}



