import 'package:dentist_shop/constants/colors.dart';
import 'package:dentist_shop/view/navigation/navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja do Dentista',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          scaffoldBackgroundColor: AppColors.backgroundColor,
          useMaterial3: true,
          dividerTheme:
              const DividerThemeData(color: AppColors.dividerColor, space: 0)),
      home: const Navigation(),
    );
  }
}
