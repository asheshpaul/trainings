import 'package:flutter/material.dart';

import '../../shared/atoms/colors.dart';
import '../atoms/filter_button.dart';
import '../organisms/filter_bottom_sheet.dart';
import '../organisms/training_list.dart';
import '../organisms/training_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trainings'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: ListView(
        children: [
          buildHighlightSection(),
          const TrainingsSlider(),
          buildFilterSection(context),
          const TrainingList(),
        ],
      ),
    );
  }

  Container buildFilterSection(BuildContext context) {
    return Container(
      color: AppColors.onPrimary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            FilterButton(
              onPressed: () async {
                await showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  builder: (_) {
                    return const FilterBottomSheet();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Container buildHighlightSection() {
    return Container(
      color: AppColors.primary,
      child: ListTile(
        dense: true,
        title: Text(
          "Highlights",
          style: TextStyle(
            color: AppColors.onPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
