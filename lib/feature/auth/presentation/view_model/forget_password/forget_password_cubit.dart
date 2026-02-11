import 'package:elearning/core/enum/request_state.dart';
import 'package:elearning/core/error/response_exceptions.dart';
import 'package:elearning/core/result/result.dart';
import 'package:elearning/feature/auth/api/models/forget_password/forget_password_request.dart';
import 'package:elearning/feature/auth/api/models/forget_password/forget_password_response.dart';
import 'package:elearning/feature/auth/api/models/forget_password/reset_code_request.dart';
import 'package:elearning/feature/auth/api/models/forget_password/reset_code_response.dart';
import 'package:elearning/feature/auth/api/models/forget_password/reset_password_request.dart';
import 'package:elearning/feature/auth/api/models/forget_password/reset_password_response.dart';
import 'package:elearning/feature/auth/domain/use_case/forget_password_use_case.dart';
import 'package:elearning/feature/auth/domain/use_case/reset_password_use_case.dart';
import 'package:elearning/feature/auth/domain/use_case/verify_code.dart';
import 'package:elearning/feature/auth/presentation/view_model/forget_password/forget_password_intent.dart';
import 'package:elearning/feature/auth/presentation/view_model/forget_password/forget_password_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(
    this._forgetPasswordUseCase,
    this._verifyCodeUseCase,
    this._resetPasswordUseCase,
  ) : super(const ForgetPasswordState());
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final VerifyCodeUseCase _verifyCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  late TextEditingController emailController;
  late TextEditingController newPassword;
  late TextEditingController confirmPassword;
  late GlobalKey<FormState> forgetPassForm;

  late TextEditingController resetCode;
  late GlobalKey<FormState> resetPasswordForm;

  Future<void> doIntent({required ForgetPasswordIntent intent}) async {
    switch (intent) {
      case ForgetPasswordInitializationIntent():
        _init();
      case ForgetPasswordFormIntent():
        _forgetPassword();
      case IsEmailTypedIntent():
        _isEmailTyped();
      case VerifyCodeIntent():
        _verifyCode();
      case VerifyCodeInitializationIntent():
        _initResetCode();
      case ResetPasswordInitializationIntent():
        _initResetPassword();
      case ResetPasswordFormIntent():
       _resetPassword();
    }
  }

  void _initResetPassword() {
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
    resetPasswordForm = GlobalKey<FormState>();
  }

  Future<void> _resetPassword() async {
    emit(state.copyWith(autoValidateMode: AutovalidateMode.always));
    emit(state.copyWith(forgetPasswordRequest: const StateStatus.loading()));
    final request = ResetPasswordRequest(
      newPassword: newPassword.text.trim(),
      email: emailController.text.trim(),
    );
    if (!resetPasswordForm.currentState!.validate()) {
      return;
    }
    final res = await _resetPasswordUseCase.resetPassword(request);
    switch (res) {
      case SuccessResult<ResetPasswordResponse>():
        emit(
          state.copyWith(
            resetPasswordRequest: StateStatus.success(res.successResult),
          ),
        );
      case FailedResult<ResetPasswordResponse>():
        emit(
          state.copyWith(
            resetPasswordRequest: StateStatus.failure(
              ResponseException(message: res.error),
            ),
          ),
        );
    }
  }

  void _initResetCode() {
    resetCode = TextEditingController();
  }

  void _init() {
    emailController = TextEditingController();
    forgetPassForm = GlobalKey<FormState>();
  }

  void _enableValidate() {
    emit(state.copyWith(autoValidateMode: AutovalidateMode.always));
  }

  Future<void> _forgetPassword() async {
    emit(state.copyWith(forgetPasswordRequest: const StateStatus.loading()));
    emit(state.copyWith(autoValidateMode: AutovalidateMode.always));
    final ForgetPasswordRequest request = ForgetPasswordRequest(
      email: emailController.text.trim(),
    );
    if (!forgetPassForm.currentState!.validate()) {
      return;
    }
    final result = await _forgetPasswordUseCase.forgetPassword(request);
    switch (result) {
      case SuccessResult<ForgetPasswordReaponse>():
        emit(
          state.copyWith(
            forgetPasswordRequest: StateStatus.success(result.successResult),
          ),
        );

      case FailedResult<ForgetPasswordReaponse>():
        emit(
          state.copyWith(
            forgetPasswordRequest: StateStatus.failure(
              ResponseException(message: result.error),
            ),
          ),
        );
    }
  }

  void _verifyCode() async {
    emit(state.copyWith(resetCodeRequest: const StateStatus.loading()));
    final ResetCodeRequest request = ResetCodeRequest(
      resetCode: resetCode.text.trim(),
    );
    final result = await _verifyCodeUseCase.verifyCode(request);
    switch (result) {
      case SuccessResult<ResetCodeResponse>():
        emit(
          state.copyWith(
            resetCodeRequest: StateStatus.success(result.successResult),
          ),
        );
      case FailedResult<ResetCodeResponse>():
        emit(
          state.copyWith(
            resetCodeRequest: StateStatus.failure(
              ResponseException(message: result.error),
            ),
          ),
        );
    }
  }

  void _isEmailTyped() {
    final isFilledEmail = emailController.text.isNotEmpty;
    emit(state.copyWith(isEmailTyping: isFilledEmail));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    resetCode.dispose();

    return super.close();
  }
}
