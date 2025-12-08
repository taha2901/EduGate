// splash_screen.dart
import 'package:edugate/core/routings/routers.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../../../core/helper/responsive_helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routers.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      body: Center(
        child: Padding(
          padding: ResponsiveHelper.pagePadding(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo - Responsive Size
              Container(
                width: ResponsiveHelper.value(
                  context: context,
                  mobile: 100.0,
                  tablet: 140.0,
                  desktop: 160.0,
                ),
                height: ResponsiveHelper.value(
                  context: context,
                  mobile: 100.0,
                  tablet: 140.0,
                  desktop: 160.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.school,
                  size: ResponsiveHelper.iconSize(context, 60),
                  color: const Color(0xFF2563EB),
                ),
              ),
              SizedBox(height: ResponsiveHelper.spacing(context, 24)),
              
              // App Name - Responsive Font
              Text(
                'EduManage',
                style: TextStyle(
                  fontSize: ResponsiveHelper.heading1(context),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: ResponsiveHelper.spacing(context, 8)),
              
              // Subtitle
              Text(
                'School Management System',
                style: TextStyle(
                  fontSize: ResponsiveHelper.bodyLarge(context),
                  color: Colors.white.withOpacity(0.8),
                  letterSpacing: 1,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ResponsiveHelper.spacing(context, 48)),
              
              // Loading Indicator - Responsive Size
              Container(
                width: ResponsiveHelper.value(
                  context: context,
                  mobile: 40.0,
                  tablet: 48.0,
                  desktop: 56.0,
                ),
                height: ResponsiveHelper.value(
                  context: context,
                  mobile: 40.0,
                  tablet: 48.0,
                  desktop: 56.0,
                ),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2563EB)),
                  strokeWidth: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
