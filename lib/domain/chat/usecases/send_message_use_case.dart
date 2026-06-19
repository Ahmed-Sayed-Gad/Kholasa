import 'package:injectable/injectable.dart';

import '../../../core/errors/result/results.dart';
import '../repository/chat_repository.dart';

@injectable
class SendMessageUseCase {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  Future<Result<String>> call(
      String message,
      ) {
    return repository.sendMessage(
      message,
    );
  }
}