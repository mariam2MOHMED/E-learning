import 'package:elearning/core/enum/request_state.dart';
import 'package:elearning/feature/auth/domain/entity/auth_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class LoginState extends Equatable{
final StateStatus<AuthEntity> loginRequest;
final AutovalidateMode autovalidateMode;
final bool isTyping;
const LoginState({
  this.loginRequest=const StateStatus.initial(),
  this.autovalidateMode = AutovalidateMode.disabled,
  this.isTyping=false
});
LoginState copyWith({
  StateStatus<AuthEntity>? loginRequest,
   AutovalidateMode? autovalidateMode,
   bool? isTyping
}){
  return LoginState(
    loginRequest: loginRequest??this.loginRequest,
    isTyping: isTyping??this.isTyping,
    autovalidateMode:autovalidateMode??this.autovalidateMode
  );
}
  @override
  List<Object?> get props => [
    loginRequest,autovalidateMode,isTyping
  ];

}