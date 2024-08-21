import 'package:flutter/material.dart';

class AppThemeData {
  static final ThemeData themeData = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.grey.shade50,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      fontFamily: 'Poppins',
    
      appBarTheme: AppBarTheme(backgroundColor: Colors.grey[50]));
}
