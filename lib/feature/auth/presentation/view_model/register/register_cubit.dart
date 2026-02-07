import 'package:elearning/core/enum/request_state.dart';
import 'package:elearning/core/error/response_exceptions.dart';
import 'package:elearning/core/result/result.dart';
import 'package:elearning/feature/auth/api/models/register/register_request.dart';
import 'package:elearning/feature/auth/domain/entity/user_entity.dart';
import 'package:elearning/feature/auth/presentation/view_model/register/register_intent.dart';
import 'package:elearning/feature/auth/presentation/view_model/register/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_case/register_use_case.dart';
@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterCubit(this._registerUseCase) : super(const RegisterState());
  late TextEditingController userName;
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController rePassword;
  late TextEditingController phone;
  late GlobalKey<FormState> formKey;
  Future<void> doIntent({required RegisterIntent intent}) async {
    switch(intent){

      case RegisterInitializationIntent():
        _init();
      case RegisterFormIntent():
       _register();
    }
  }
  void _init() {
    userName = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    rePassword = TextEditingController();
    phone = TextEditingController();
    formKey= GlobalKey<FormState>();
    // emit(state.copyWith(
    //   autovalidateMode: AutovalidateMode.disabled
    // ));
  }

  Future<void> _register() async {
    emit(state.copyWith(registerStatus: const StateStatus.loading()));
    final request = RegisterRequest(
      username: userName.text.trim(),
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
      email: email.text.trim(),
      password: password.text.trim(),
      rePassword: rePassword.text.trim(),
      phone: phone.text.trim(),
    );
    final result = await _registerUseCase.register(request);
    switch (result) {
      case SuccessResult<UserEntity>():
        emit(
          state.copyWith(
            registerStatus: StateStatus.success(result.successResult),
          ),
        );
        break;
      case FailedResult<UserEntity>():
        emit(
          state.copyWith(
            registerStatus: StateStatus.failure(
              ResponseException(message: result.error),
            ),
          ),
        );
        break;
    }
  }

  void _enableValidate() {
    emit(state.copyWith(
        autovalidateMode: AutovalidateMode.always));
  }

  void _validateUserInfo() {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(isValid: true));

      return;
    } else {
      _enableValidate();
      emit(state.copyWith(isValid: false));
    }
  }

  @override
  Future<void> close() {
    userName.dispose();
    firstName.dispose();

    lastName.dispose();
    email.dispose();
    password.dispose();
    rePassword.dispose();
    phone.dispose();

    return super.close();
  }
}
