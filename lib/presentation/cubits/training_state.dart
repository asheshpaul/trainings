import 'dart:collection';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/training_model.dart';

class TrainingState extends Equatable {
  final UnmodifiableListView<Training> trainings;
  final UnmodifiableListView<Training> filteredTrainings;
  final Set<String> selectedLocations;
  final Set<String> selectedTrainings;
  final bool isLoading;
  final int currentFilterTabIndex;
  final int currentSliderIndex;
  final CarouselSliderController sliderController;

  const TrainingState({
    required this.trainings,
    required this.filteredTrainings,
    required this.selectedLocations,
    required this.selectedTrainings,
    required this.isLoading,
    required this.currentFilterTabIndex,
    this.currentSliderIndex = 0,
    required this.sliderController,
  });

  factory TrainingState.initial() {
    return TrainingState(
      trainings: UnmodifiableListView([]),
      filteredTrainings: UnmodifiableListView([]),
      selectedLocations: const {},
      selectedTrainings: const {},
      isLoading: false,
      currentFilterTabIndex: 1,
      currentSliderIndex: 0,
      sliderController: CarouselSliderController(),
    );
  }

  TrainingState copyWith({
    List<Training>? trainings,
    List<Training>? filteredTrainings,
    Set<String>? selectedLocations,
    Set<String>? selectedTrainings,
    bool? isLoading,
    int? currentFilterTabIndex,
    int? currentSliderIndex,
    CarouselSliderController? sliderController,
  }) {
    return TrainingState(
      trainings:
          trainings != null ? UnmodifiableListView(trainings) : this.trainings,
      filteredTrainings: filteredTrainings != null
          ? UnmodifiableListView(filteredTrainings)
          : this.filteredTrainings,
      selectedLocations: selectedLocations ?? this.selectedLocations,
      selectedTrainings: selectedTrainings ?? this.selectedTrainings,
      isLoading: isLoading ?? this.isLoading,
      currentFilterTabIndex:
          currentFilterTabIndex ?? this.currentFilterTabIndex,
      currentSliderIndex: currentSliderIndex ?? this.currentSliderIndex,
      sliderController: sliderController ?? this.sliderController,
    );
  }

  @override
  List<Object> get props => [
        trainings,
        filteredTrainings,
        selectedLocations,
        selectedTrainings,
        isLoading,
        currentFilterTabIndex,
        currentSliderIndex,
        sliderController,
      ];
}
