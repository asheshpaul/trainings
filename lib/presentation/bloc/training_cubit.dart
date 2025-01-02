import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/address_model.dart';
import '../../domain/training_repository.dart';
import 'training_state.dart';

class TrainingCubit extends Cubit<TrainingState> {
  TrainingCubit(this.repository) : super(TrainingState.initial());

  final TrainingRepository repository;

  /// Load all trainings
  void loadTrainings() async {
    emit(state.copyWith(isLoading: true));
    try {
      final allTrainings = await repository.getAllTrainings();
      emit(state.copyWith(
        trainings: allTrainings,
        filteredTrainings: allTrainings,
        isLoading: false,
      ));
    } catch (e) {
      if (kDebugMode) {
        print('Error loading trainings: $e');
      }
    }
  }

  /// change sliders
  void onSliderChange(int index) {
    emit(state.copyWith(
      currentSliderIndex: index,
      sliderController: state.sliderController,
    ));
  }

  /// next slider
  void nextSlider() => state.sliderController.nextPage();

  /// previous slider
  void previousSlider() => state.sliderController.previousPage();

  /// Get unique addresses (city + countryCode)
  List<Address> get getAddresses =>
      state.trainings.map((training) => training.address).toSet().toList();

  /// Get unique training titles from the list of trainings
  List<String> get getTrainings =>
      state.trainings.map((training) => training.title).toSet().toList();

  /// Add or remove location filter
  void addOrRemoveLocationFilter(String location) {
    final updatedLocations = Set<String>.from(state.selectedLocations);
    updatedLocations.contains(location)
        ? updatedLocations.remove(location)
        : updatedLocations.add(location);

    applyFilters(updatedLocations, state.selectedTrainings);
  }

  /// Toggle training filter
  void addOrRemoveTrainingFilter(String training) {
    final updatedTrainings = Set<String>.from(state.selectedTrainings);
    updatedTrainings.contains(training)
        ? updatedTrainings.remove(training)
        : updatedTrainings.add(training);

    applyFilters(state.selectedLocations, updatedTrainings);
  }

  /// Clear all filters
  void clearFilters() {
    emit(state.copyWith(
      selectedLocations: {},
      selectedTrainings: {},
      filteredTrainings: state.trainings,
    ));
  }

  /// Change filter options (e.g., predefined filters)
  void changeFilterOptions(int index) {
    emit(state.copyWith(currentFilterTabIndex: index));
  }

  /// Apply filters to training list
  void applyFilters(
      Set<String> selectedLocations, Set<String> selectedTrainings) {
    final filteredTrainings = state.trainings.where((training) {
      final locationMatch = selectedLocations.isEmpty ||
          selectedLocations.contains(training.address.city);
      final trainingMatch = selectedTrainings.isEmpty ||
          selectedTrainings.contains(training.title);
      return locationMatch && trainingMatch;
    }).toList();

    emit(state.copyWith(
      selectedLocations: selectedLocations,
      selectedTrainings: selectedTrainings,
      filteredTrainings: filteredTrainings,
    ));
  }
}
