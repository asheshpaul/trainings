import '../data/data_sources/dummy_trainings.dart';
import '../data/models/training_model.dart';

class TrainingRepository {
  Future<List<Training>> getAllTrainings() async {
    /// Replace with actual data fetching logic later
    /// For now, we can still use getDummyTrainings() here
    return getDummyTrainings();
  }
}
