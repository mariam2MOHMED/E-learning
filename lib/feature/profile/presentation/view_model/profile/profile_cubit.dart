import 'package:elearning/core/enum/request_state.dart';
import 'package:elearning/core/error/response_exceptions.dart';
import 'package:elearning/core/result/result.dart';
import 'package:elearning/feature/profile/api/model/edit_profile_request.dart';
import 'package:elearning/feature/profile/domain/entity/user_profile.dart';
import 'package:elearning/feature/profile/domain/use_case/edit_profile_use_case.dart';
import 'package:elearning/feature/profile/presentation/view_model/profile/profile_events.dart';
import 'package:elearning/feature/profile/presentation/view_model/profile/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_case/get_logged_user_profile_use_case.dart';

@injectable
class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this._getLoggedUserProfileUseCase, this._editProfileUseCase)
    : super(const ProfileStates());
  final GetLoggedUserProfileUseCase _getLoggedUserProfileUseCase;
  final EditProfileUseCase _editProfileUseCase;

  void doIntent({required ProfileIntent intent}) {
    switch (intent) {
      case GetLoggedUserInfoEvent():
        _getLoggedUserInfo();
      case EditProfileFormEvent():
        _editProfile(intent);
    }
  }

  Future<void> _getLoggedUserInfo() async {
    emit(state.copyWith(profileStatus: const StateStatus.loading()));
    final result = await _getLoggedUserProfileUseCase.getLoggerUserInfo();
    switch (result) {
      case SuccessResult<UserProfile>():
        emit(
          state.copyWith(
            profileStatus: StateStatus.success(result.successResult),
          ),
        );
      case FailedResult<UserProfile>():
        emit(
          state.copyWith(
            profileStatus: StateStatus.failure(
              ResponseException(message: result.error),
            ),
          ),
        );
    }
  }

  Future<void> _editProfile(EditProfileFormEvent event) async {
    emit(state.copyWith(editProfileStatus: const StateStatus.loading()));
    final request = EditProfileRequest(
      firstName: event.firstName,
      lastName: event.lastName,
      email: event.username,
      phone: event.phone,
    );
    final result = await _editProfileUseCase.editProfile(request);
    switch (result) {
      case SuccessResult<UserProfile>():
        emit(
          state.copyWith(
            editProfileStatus: StateStatus.success(result.successResult),
          ),
        );
      case FailedResult<UserProfile>():
        emit(
          state.copyWith(
            editProfileStatus: StateStatus.failure(
              ResponseException(message: result.error),
            ),
          ),
        );
    }
  }
  @override
  Future<void> close() {
    return super.close();
  }
}
