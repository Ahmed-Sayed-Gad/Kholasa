import 'package:injectable/injectable.dart';
import '../../../core/errors/result/results.dart';
import '../entities/recent_Items.dart';
import '../repositories/home_repository.dart';

@injectable
class GetRecentItemsUseCase {
  final HomeRepository repository;

  GetRecentItemsUseCase(this.repository);

  Future<Result<List<RecentItem>>> call() {
    return repository.getRecentItems();
  }
}
