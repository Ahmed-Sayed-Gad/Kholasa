import '../repositories/history_repository.dart';

class ToggleSavedUseCase {
  final HistoryRepository repository;

  ToggleSavedUseCase(this.repository);

  Future<void> call(String id) {
    return repository.toggleSaved(id);
  }
}