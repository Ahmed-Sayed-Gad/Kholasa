import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../domain/link/use_case/summarize_url_use_case.dart';
import 'link_state.dart';

@injectable
class LinkCubit extends Cubit<LinkState> {
  final SummarizeUrlUseCase useCase;

  LinkCubit(this.useCase)
      : super(LinkInitial());

  Future<void> submitLink(
      String url,
      ) async {
    if (url.trim().isEmpty) {
      emit(
        LinkFailure(
          "Please enter a URL",
        ),
      );
      return;
    }

    emit(LinkLoading());

    final result =
    await useCase(
      url: url,
      language: "en",
      format: "text",
      length: "2",
      sessionId: "default",
    );

    result.fold(
      onSuccess: (summary) {
        emit(
          LinkSuccess(summary),
        );
      },
      onFailure: (failure) {
        emit(
          LinkFailure(
            failure.userFriendlyMessage,
          ),
        );
      },
    );
  }

  void reset() {
    emit(LinkInitial());
  }
}