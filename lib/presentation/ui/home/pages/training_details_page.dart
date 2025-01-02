import 'package:flutter/material.dart';

import '../../../../data/models/training_model.dart';
import '../atoms/enroll_button.dart';
import '../atoms/trainer_info.dart';
import '../molecules/training_date_time_address.dart';
import '../templates/training_details_template.dart';

class TrainingDetailsPage extends StatelessWidget {
  const TrainingDetailsPage({super.key, required this.training});

  final Training training;

  @override
  Widget build(BuildContext context) {
    return TrainingDetailsTemplate(
      bannerImage: training.bannerImage,
      titleHeader: training.titleHeader,
      trainingTitle: training.title,
      summary: training.summary,
      trainerInfo: TrainerInfo(
        imageUrl: training.trainerImg,
        title: training.trainerTitle,
        name: training.trainerName,
      ),
      dateTimeAddressDetails:
          TrainingDateTimeAddressDetails(training: training),
      enrollButton: EnrollButton(
        onPressed: () {
          /* Handle enrollment */
        },
      ),
    );
  }
}
