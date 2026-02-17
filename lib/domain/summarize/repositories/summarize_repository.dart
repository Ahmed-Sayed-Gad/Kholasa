import '../../../core/errors/result/results.dart';
import '../../upload/entities/upload_file.dart';
import '../entities/summary_result.dart';

abstract class SummarizeRepository {
  Future<Result<SummaryResult>> summarize(UploadFile file);
}
