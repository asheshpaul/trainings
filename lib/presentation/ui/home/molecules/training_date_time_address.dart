import 'package:flutter/material.dart';

import '../../../../data/models/training_model.dart';
import '../atoms/training_address.dart';
import '../atoms/training_date_time.dart';

/// A molecule combining TrainingDateTime, TrainingAddress, and the time slot:
class TrainingDateTimeAddressDetails extends StatelessWidget {
  const TrainingDateTimeAddressDetails({super.key, required this.training});

  final Training training;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          TrainingDateTime(
              from: training.fromDateTime, to: training.toDateTime),
          const Text('08:30 am - 12:30 pm'),
          // todo: Consider making this dynamic
          TrainingAddress(address: training.address),
        ],
      ),
    );
  }
}
