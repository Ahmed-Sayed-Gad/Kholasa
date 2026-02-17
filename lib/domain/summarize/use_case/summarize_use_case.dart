import '../../../core/errors/result/results.dart';
import '../../upload/entities/upload_file.dart';
import '../entities/summary_result.dart';
import '../repositories/summarize_repository.dart';

class SummarizeUseCase {
  final SummarizeRepository repository;

  SummarizeUseCase(this.repository);

  Future<Result<SummaryResult>> call(UploadFile file) {
    return repository.summarize(file);
  }
}
