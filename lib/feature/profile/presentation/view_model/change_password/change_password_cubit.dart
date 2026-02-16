import 'package:elearning/core/enum/request_state.dart';
import 'package:elearning/core/error/response_exceptions.dart';
import 'package:elearning/core/result/result.dart';
import 'package:elearning/feature/profile/api/model/change_password_request.dart';
import 'package:elearning/feature/profile/api/model/change_password_response.dart';
import 'package:elearning/feature/profile/domain/use_case/change_password_use_case.dart';
import 'package:elearning/feature/profile/presentation/view_model/change_password/change_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'change_password_event.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._changePasswordUseCase)
    : super(const ChangePasswordState());
  final ChangePasswordUseCase _changePasswordUseCase;
  late TextEditingController oldPassword;
  late TextEditingController newPassword;
  late TextEditingController confirmNewPassword;
  late GlobalKey<FormState> formkey;

  Future<void> doIntent({required ChangePasswordIntent intent}) async {
    switch (intent) {
      case ChangePasswordInitializationIntent():
      _init();
      case ChangePasswordFormIntent():
       _changePassword();
      case IsTypingPasswordIntent():
        _isTyping();
    }
  }
void _changePassword()async{
    final request=ChangePasswordRequest(
      oldPassword: oldPassword.text.trim(),
      password: newPassword.text.trim(),
      rePassword: confirmNewPassword.text.trim(),
    );
    if(!formkey.currentState!.validate()){return;}
    emit(
      state.copyWith(
        changePasswordStatus: const StateStatus.loading(),
        autovalidateMode: AutovalidateMode.always
      )
    );
    final result=await _changePasswordUseCase.changePassword(request);
    switch(result){

      case SuccessResult<ChangePasswordResponse>():
        emit(
            state.copyWith(
                changePasswordStatus:  StateStatus.success(result.successResult),
            )
        );
      case FailedResult<ChangePasswordResponse>():
        emit(
            state.copyWith(
              changePasswordStatus:  StateStatus.failure(
                 ResponseException(message: result.error)),
            )
        );
    }
}
  void _init() {
    oldPassword = TextEditingController();
    newPassword = TextEditingController();
    confirmNewPassword = TextEditingController();
    formkey = GlobalKey<FormState>();
  }
void _isTyping(){
    final isFilled=oldPassword.text.isNotEmpty&& newPassword.text.isNotEmpty
        &&confirmNewPassword.text.isNotEmpty;
    emit(state.copyWith(
        isTyping: isFilled));
}
  @override
  Future<void> close() {
    oldPassword.dispose();
    newPassword.dispose();
    confirmNewPassword.dispose();
    return super.close();
  }
}
