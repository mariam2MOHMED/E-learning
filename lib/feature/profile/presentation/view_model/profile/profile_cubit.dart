import 'package:elearning/core/enum/request_state.dart';
import 'package:elearning/core/error/response_exceptions.dart';
import 'package:elearning/core/result/result.dart';
import 'package:elearning/feature/profile/api/model/edit_profile_request.dart';
import 'package:elearning/feature/profile/domain/entity/user_profile.dart';
import 'package:elearning/feature/profile/domain/use_case/edit_profile_use_case.dart';
import 'package:elearning/feature/profile/presentation/view_model/profile/profile_events.dart';
import 'package:elearning/feature/profile/presentation/view_model/profile/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_case/get_logged_user_profile_use_case.dart';

@injectable
class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this._getLoggedUserProfileUseCase, this._editProfileUseCase)
    : super(const ProfileStates());
  final GetLoggedUserProfileUseCase _getLoggedUserProfileUseCase;
  final EditProfileUseCase _editProfileUseCase;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState>  editFormKey=GlobalKey<FormState>();

  void doIntent({required ProfileIntent intent}) {
    switch (intent) {
      case GetLoggedUserInfoEvent():
        _getLoggedUserInfo();
        break;
      case EditProfileFormEvent():
        _editProfile();
        break;
    }
  }

  Future<void> _getLoggedUserInfo() async {
    emit(state.copyWith(profileStatus: const StateStatus.loading()));
    final result = await _getLoggedUserProfileUseCase.getLoggerUserInfo();
    switch (result) {
      case SuccessResult<UserProfile>():
        firstNameController.text=result.successResult.firstName;
        lastNameController.text=result.successResult.lastName;
        userNameController.text=result.successResult.username;
        phoneNumberController.text=result.successResult.phone;
        emailController.text=result.successResult.email;
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

  Future<void> _editProfile() async {
    if (!editFormKey.currentState!.validate()) return;
    emit(state.copyWith(
        editAutouvalidateMode: AutovalidateMode.always,
        editProfileStatus: const StateStatus.loading()));
    final request = EditProfileRequest(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneNumberController.text.trim(),
      username: userNameController.text.trim(),
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
  firstNameController.dispose();
  lastNameController.dispose();
  userNameController.dispose();
  emailController.dispose();
  phoneNumberController.dispose();
    return super.close();
  }
}
