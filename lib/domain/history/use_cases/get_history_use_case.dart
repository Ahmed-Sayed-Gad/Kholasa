import '../entities/history_item.dart';
import '../repositories/history_repository.dart';

class GetHistoryUseCase {
  final HistoryRepository repository;

  GetHistoryUseCase(this.repository);

  List<HistoryItem> call() {
    return repository.getAll();
  }
}