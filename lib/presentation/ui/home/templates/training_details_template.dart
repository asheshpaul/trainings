import 'package:flutter/material.dart';

import '../atoms/training_header.dart';

class TrainingDetailsTemplate extends StatelessWidget {
  const TrainingDetailsTemplate({
    super.key,
    required this.bannerImage,
    required this.titleHeader,
    required this.trainingTitle,
    required this.summary,
    required this.trainerInfo,
    required this.dateTimeAddressDetails,
    required this.enrollButton,
  });

  final String bannerImage;
  final String titleHeader;
  final String trainingTitle;
  final String summary;
  final Widget trainerInfo;
  final Widget dateTimeAddressDetails;
  final Widget enrollButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Training Details')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: const ColorFilter.mode(
                        Colors.black54,
                        BlendMode.darken,
                      ),
                      image: AssetImage(bannerImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                TrainingHeader(
                  titleHeader: titleHeader,
                  trainingTitle: trainingTitle,
                ),
                ListTile(
                  title: Text(summary),
                ),
                trainerInfo,
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: dateTimeAddressDetails,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: enrollButton,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
