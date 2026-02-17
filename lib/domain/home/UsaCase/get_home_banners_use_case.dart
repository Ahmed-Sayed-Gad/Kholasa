import 'package:injectable/injectable.dart';
import '../../../core/errors/result/results.dart';
import '../entities/home_banner.dart';
import '../repositories/home_repository.dart';

@injectable
class GetHomeBannersUseCase {
  final HomeRepository repository;

  GetHomeBannersUseCase(this.repository);

  Future<Result<List<HomeBanner>>> call() {
    return repository.getHomeBanners();
  }
}
