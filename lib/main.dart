import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/training_repository.dart';
import 'presentation/bloc/training_cubit.dart';
import 'presentation/ui/home/pages/home_page.dart';
import 'presentation/ui/shared/atoms/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrainingCubit(TrainingRepository())..loadTrainings(),
      child: MaterialApp(
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
            ),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
