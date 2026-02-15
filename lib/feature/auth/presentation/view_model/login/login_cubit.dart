import 'package:elearning/core/cache/cache_helper.dart';
import 'package:elearning/core/constants/constants.dart';
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

import '../../../../../core/cache/secure_storage_helper.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  @factoryMethod
  LoginCubit(this._loginUseCase,
      this._secureStorage,this._sharedPreferencesHelper) : super(const LoginState());
  final LoginUseCase _loginUseCase;
  final SecureStorage _secureStorage;
  final SharedPreferencesHelper _sharedPreferencesHelper;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  Future<void> doIntent({required LoginIntent intent}) async{
    switch (intent) {
      case LoginInitializationIntent():
        _init();
        case LoginFormIntent():
      await   _login();
     case IsTypingIntent():
        _isTyping();
      case IsRememberIntent():
    await     _toggleRememberMe();
    }
  }

  void _init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    _getRememberValue();
    if(state.isRemember){_getRememberUserData();}
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
        final token=result.successResult.token;
if(state.isRemember){
  _getRememberValue();
}
_secureStorage.saveUserToken(token: token);
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
//   void getRememberValue(){
//     final bool? isRemember= _sharedPreferencesHelper.getBool(key: Constants.isRemember);
//   emit(state.copyWith(
//     isRemember: isRemember
//   ));
//   }
//   Future<void> _toggleRememberMe() async{
//     final newRememberMe = !state.isRemember;
//     await _sharedPreferencesHelper.
//     setData(key: Constants.isRemember, value: newRememberMe);
//     if (!newRememberMe) {
//        _forgetUserData();
//     }
//     emit(state.copyWith(isRemember: newRememberMe,
//      loginRequest: const StateStatus.initial()
//     ));
//   }
//   void _forgetUserData()async{
// await _secureStorage.deleteData(key: Constants.email);
// await _secureStorage.deleteData(key: Constants.password);
//
//   }
//   Future<void> _getRememberedUserData() async {
//     emailController.text =
//         await _secureStorage.getData(key: Constants.email) ?? "";
//     passwordController.text =
//         await _secureStorage.getData(key: Constants.password) ?? "";
//   }
  Future<void> _toggleRememberMe()async{
    final newRemember=!state.isRemember;
    await _sharedPreferencesHelper.setData(key: Constants.isRemember, value: newRemember);
    if(!newRemember){
      _forgetUserData();
    }
    emit(state.copyWith(
      isRemember: newRemember,
      loginRequest: const StateStatus.initial()
    ));
  }
  void _getRememberValue(){
    final bool? isRemember= _sharedPreferencesHelper.getBool(key: Constants.isRemember);
    emit(state.copyWith(
      isRemember: isRemember
    ));
  }
  void _forgetUserData()async{
    await _secureStorage.deleteData(key: Constants.email);
    await _secureStorage.deleteData(key: Constants.password);

  }
 void _getRememberUserData()async{
    emailController.text=await _secureStorage.getData(key: Constants.email
        )??"";
    passwordController.text=
        await _secureStorage.getData(key: Constants.email
        )??"";
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
