import 'package:flutter/material.dart';

import '../../../../data/models/training_model.dart';
import '../../shared/atoms/slider_styles.dart';
import '../atoms/slider_buttons.dart';
import '../pages/training_details_page.dart';

class TrainingSlideItem extends StatelessWidget {
  const TrainingSlideItem({
    super.key,
    required this.training,
  });

  final Training training;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: const ColorFilter.mode(
            Colors.black54,
            BlendMode.darken,
          ),
          image: AssetImage(training.bannerImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              training.title,
              style: titleTextStyle(),
            ),
            subtitle: Text(
              '${training.address.city}, ${training.address.countryCode} - 11 Jan - 13 Jan',
              style: subTitleTextStyle(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      "\$${training.actualPrice.round()}",
                      style: actualPriceTextStyle(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "\$${training.offerPrice.round()}",
                      style: offerPriceTextStyle(),
                    ),
                  ),
                ],
              ),
              ViewDetailsButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          TrainingDetailsPage(training: training)));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
