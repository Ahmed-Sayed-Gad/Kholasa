import 'package:injectable/injectable.dart';

import '../../../core/errors/result/results.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

@injectable
class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<Result<ProfileEntity>> call() {
    return repository.getProfile();
  }
}