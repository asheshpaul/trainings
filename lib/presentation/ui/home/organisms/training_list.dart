import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/training_cubit.dart';
import '../../../bloc/training_state.dart';
import '../../shared/atoms/colors.dart';
import '../atoms/empty_message.dart';
import '../atoms/loading_indicator.dart';
import '../molecules/training_list_item.dart';
import '../pages/training_details_page.dart';

class TrainingList extends StatelessWidget {
  const TrainingList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingCubit, TrainingState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const LoadingIndicator();
        }
        if (state.trainings.isEmpty) {
          return const EmptyMessage(message: 'No trainings available.');
        }
        final trainingsToShow = state.filteredTrainings.isEmpty
            ? state.trainings
            : state.filteredTrainings;

        return Material(
          color: AppColors.greyBG,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListView.separated(
              key: const ValueKey<String>('items_list'),
              padding: const EdgeInsets.symmetric(horizontal: 8)
                  .copyWith(bottom: 16),
              separatorBuilder: (c, i) => const SizedBox(height: 8),
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: trainingsToShow.length,
              itemBuilder: (context, index) {
                var training = trainingsToShow[index];
                return TrainingListItem(
                  training: training,
                  onEnroll: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            TrainingDetailsPage(training: training)));},
                );
              },
            ),
          ),
        );
      },
    );
  }
}
