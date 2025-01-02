import 'package:flutter/material.dart';

import '../../../../data/models/training_model.dart';
import '../../shared/atoms/colors.dart';
import '../../shared/atoms/dashed_line_vertical_divider.dart';
import '../pages/training_details_page.dart';
import 'training_content.dart';
import 'training_date_time_address.dart';

class TrainingListItem extends StatelessWidget {
  const TrainingListItem(
      {super.key, required this.training, required this.onEnroll});

  final Training training;
  final VoidCallback onEnroll;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TrainingDetailsPage(training: training)));
      },
      child: Card(
        elevation: 2,
        color: AppColors.onPrimary,
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: TrainingDateTimeAddressDetails(training: training),
            ),
            _buildDivider(),
            Expanded(
              flex: 3,
              child: TrainingContent(
                training: training,
                onEnroll: onEnroll,
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomPaint _buildDivider() {
    return CustomPaint(
      /// width and height of the divider
      size: const Size(1, 150),
      painter: DashedLineVerticalDivider(),
    );
  }
}
