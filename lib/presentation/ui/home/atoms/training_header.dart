import 'package:flutter/material.dart';

import '../../shared/atoms/colors.dart';

/// An atom for the training category/header:
class TrainingHeader extends StatelessWidget {
  const TrainingHeader({
    super.key,
    required this.titleHeader,
    required this.trainingTitle,
  });

  final String titleHeader, trainingTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        titleHeader,
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        trainingTitle,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
