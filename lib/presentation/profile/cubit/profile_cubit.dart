import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../domain/profile/use_case/get_profile_use_case.dart';
import 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {

  final GetProfileUseCase useCase;

  ProfileCubit(this.useCase)
      : super(ProfileInitial());

  Future<void> loadProfile() async {

    emit(ProfileLoading());

    final result = await useCase();

    result.fold(
      onSuccess: (profile) {
        emit(ProfileLoaded(profile));
      },
      onFailure: (failure) {
        emit(
          ProfileError(
            failure.userFriendlyMessage,
          ),
        );
      },
    );
  }
}