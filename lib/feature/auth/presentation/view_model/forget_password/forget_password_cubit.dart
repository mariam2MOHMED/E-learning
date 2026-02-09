import 'package:elearning/core/enum/request_state.dart';
import 'package:elearning/core/error/response_exceptions.dart';
import 'package:elearning/core/result/result.dart';
import 'package:elearning/feature/auth/api/models/forget_password/forget_password_request.dart';
import 'package:elearning/feature/auth/api/models/forget_password/forget_password_response.dart';
import 'package:elearning/feature/auth/domain/use_case/forget_password_use_case.dart';
import 'package:elearning/feature/auth/presentation/view_model/forget_password/forget_password_intent.dart';
import 'package:elearning/feature/auth/presentation/view_model/forget_password/forget_password_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState>{
  ForgetPasswordCubit(this._forgetPasswordUseCase):super(const ForgetPasswordState());
  late TextEditingController emailController;
  late GlobalKey<FormState>forgetPassForm;
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  Future<void>doIntent(ForgetPasswordIntent intent)async{
    switch(intent){
      case ForgetPasswordInitializationIntent():
        throw UnimplementedError();
      case ForgetPasswordFormIntent():
        throw UnimplementedError();
    }
  }
  void _init(){
    emailController=TextEditingController();
    forgetPassForm=GlobalKey<FormState>();
  }
  Future<void>  _forgetPassword()async{
    emit(state.copyWith(forgetPasswordRequest: const StateStatus.loading()));
    final ForgetPasswordRequest request=ForgetPasswordRequest(
      email: emailController.text.trim()
    );
  final result=await  _forgetPasswordUseCase.forgetPassword(request);
  switch(result){

    case SuccessResult<ForgetPasswordReaponse>():

      emit(state.copyWith(forgetPasswordRequest:  StateStatus.success(result.
      successResult)));
    case FailedResult<ForgetPasswordReaponse>():
      emit(state.copyWith(forgetPasswordRequest:
      StateStatus.failure(ResponseException(message: result.error))));
  }

  }

@override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}