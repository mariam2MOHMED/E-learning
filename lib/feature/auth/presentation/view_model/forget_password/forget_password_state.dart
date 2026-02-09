import 'package:elearning/core/enum/request_state.dart';
import 'package:elearning/feature/auth/api/models/forget_password/forget_password_response.dart';
import 'package:elearning/feature/auth/api/models/forget_password/reset_code_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ForgetPasswordState extends Equatable{
final StateStatus<ForgetPasswordReaponse>forgetPasswordRequest;
final StateStatus<ResetCodeResponse>resetCodeRequest;

final bool isEmailTyping;
final AutovalidateMode autoValidateMode;
const ForgetPasswordState({this.forgetPasswordRequest=
const StateStatus.initial(),
  this.isEmailTyping=false,
this.resetCodeRequest=const StateStatus.initial()
,this.autoValidateMode=AutovalidateMode.disabled});
ForgetPasswordState copyWith({
  StateStatus<ForgetPasswordReaponse>?forgetPasswordRequest,
  bool? isEmailTyping,
  AutovalidateMode?autoValidateMode,
  StateStatus<ResetCodeResponse>?resetCodeRequest
}){
  return ForgetPasswordState(
  forgetPasswordRequest: forgetPasswordRequest??this.forgetPasswordRequest,
    isEmailTyping: isEmailTyping??this.isEmailTyping,
    autoValidateMode: autoValidateMode??this.autoValidateMode,
    resetCodeRequest: resetCodeRequest??this.resetCodeRequest
  );
}
  @override
  List<Object?> get props => [resetCodeRequest,
    forgetPasswordRequest,isEmailTyping,autoValidateMode];
}