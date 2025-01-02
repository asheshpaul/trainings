import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/training_cubit.dart';
import '../../../cubits/training_state.dart';
import '../../shared/atoms/colors.dart';
import '../atoms/empty_message.dart';
import '../atoms/loading_indicator.dart';
import '../atoms/slider_buttons.dart';
import '../molecules/training_slide_item.dart';

class TrainingsSlider extends StatelessWidget {
  const TrainingsSlider({super.key});

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
        return Container(
          color: AppColors.primary,
          child: Row(
            children: [
              ChangeSliderButton(
                onTap: () => context.read<TrainingCubit>().previousSlider(),
                iconData: Icons.arrow_back_ios_new,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8),
                  child: CarouselSlider.builder(
                    carouselController: state.sliderController,
                    options: CarouselOptions(
                      height: 184,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      autoPlayAnimationDuration:
                      const Duration(milliseconds: 1500),
                      onPageChanged: (index, reason) {
                        context.read<TrainingCubit>().onSliderChange(index);
                      },
                    ),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      var training = state.trainings[itemIndex];
                      return TrainingSlideItem(training: training);

                    },
                  ),
                ),
              ),
              ChangeSliderButton(
                onTap: () => context.read<TrainingCubit>().nextSlider(),
                iconData: Icons.arrow_forward_ios,
              ),
            ],
          ),
        );
      },
    );
  }
}
