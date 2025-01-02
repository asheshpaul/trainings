import 'package:flutter/material.dart';

import '../../../../data/models/training_model.dart';
import '../atoms/enroll_button.dart';
import '../atoms/trainer_info.dart';
import '../atoms/training_header.dart';

/// A molecule combining TrainingHeader, TrainerInfo, and EnrollButton:
class TrainingContent extends StatelessWidget {
  const TrainingContent(
      {super.key, required this.training, required this.onEnroll});

  final Training training;
  final VoidCallback onEnroll;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TrainingHeader(
          titleHeader: training.titleHeader,
          trainingTitle: training.title,
        ),
        TrainerInfo(
          imageUrl: training.trainerImg,
          title: training.trainerTitle,
          name: training.trainerName,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 8),
              child: EnrollButton(onPressed: onEnroll),
            ),
          ],
        ),
      ],
    );
  }
}
