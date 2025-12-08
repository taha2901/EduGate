import 'package:edugate/core/routings/app_router.dart';
import 'package:edugate/core/routings/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // ⭐ أضف هذا
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await initializeDateFormatting('ar', null);
  
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduManage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF2563EB),
        fontFamily: 'Cairo',
      ),
      
      // ⭐ أضف هذه الـ 3 أسطر
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'EG'), // العربية
        Locale('en', 'US'), // الإنجليزية
      ],
      locale: Locale('ar', 'EG'), // ⭐ اللغة الافتراضية
      
      initialRoute: Routers.splashScreen,
      onGenerateRoute: appRouter.generateRoute,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('الصفحة غير موجودة: ${settings.name}'),
            ),
          ),
        );
      },
    );
  }
}
