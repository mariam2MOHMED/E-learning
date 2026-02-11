import 'package:elearning/core/enum/request_state.dart';
import 'package:elearning/core/error/response_exceptions.dart';
import 'package:elearning/core/result/result.dart';
import 'package:elearning/feature/auth/api/models/login/login_request.dart';
import 'package:elearning/feature/auth/domain/entity/auth_entity.dart';
import 'package:elearning/feature/auth/domain/use_case/login_use_case.dart';
import 'package:elearning/feature/auth/presentation/view_model/login/login_event.dart';
import 'package:elearning/feature/auth/presentation/view_model/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(const LoginState());
  final LoginUseCase _loginUseCase;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  void doIntent({required LoginIntent intent}) {
    switch (intent) {
      case LoginInitializationIntent():
        _init();
      case LoginFormIntent():
        _login();

      case IsTypingIntent():
        _isTyping();
    }
  }

  void _init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  Future<void> _login() async {
    emit(
      state.copyWith(
        loginRequest: const StateStatus.loading(),
        autovalidateMode: AutovalidateMode.always,
      ),
    );
    if (!formKey.currentState!.validate()) {
      return;
    }
    final request = LoginRequest(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    final result = await _loginUseCase.login(request);
    switch (result) {
      case SuccessResult<AuthEntity>():
        emit(
          state.copyWith(
            loginRequest: StateStatus.success(result.successResult),
          ),
        );
      case FailedResult<AuthEntity>():
        emit(
          state.copyWith(
            loginRequest: StateStatus.failure(
              ResponseException(message: result.error),
            ),
          ),
        );
    }
  }

  void _isTyping() {
    final isFilled =
        emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty;
    emit(state.copyWith(isTyping: isFilled));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();

    return super.close();
  }
}
