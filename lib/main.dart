import 'package:flutter/material.dart';
import 'package:qaho/routes/app_page.dart';
import 'package:qaho/utils/theme/theme_data.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Qaho',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.themeData,
      routerConfig: AppPage().goRouter,
      


      
    );
  }
}
