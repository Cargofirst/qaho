import 'package:flutter/material.dart';
import 'package:qaho/page/chat.dart';
import 'package:qaho/page/history.dart';
import 'package:qaho/utils/theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.themeData,
      home: const HistortyPage(),
      
    );
  }
}
