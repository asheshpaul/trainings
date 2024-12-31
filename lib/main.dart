import 'package:flutter/material.dart';

import 'presentation/screens/home_screen.dart';
import 'shared/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trainings',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            titleTextStyle: const TextStyle(
              fontFamily: "Times new roman",
              fontSize: 28,
              fontWeight: FontWeight.bold,
            )),
      ),
      home: const HomeScreen(),
    );
  }
}
