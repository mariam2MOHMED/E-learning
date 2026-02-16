import 'package:elearning/core/enum/request_state.dart';
import 'package:elearning/feature/profile/api/model/change_password_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ChangePasswordState extends Equatable{
final StateStatus<ChangePasswordResponse> changePasswordStatus;
final AutovalidateMode autovalidateMode;
final bool isTyping;


const ChangePasswordState( {
  this.changePasswordStatus=const StateStatus.initial(),
  this.autovalidateMode=AutovalidateMode.disabled,
  this.isTyping=false
});
ChangePasswordState copyWith({
  StateStatus<ChangePasswordResponse>? changePasswordStatus,
   AutovalidateMode? autovalidateMode,
   bool? isTyping
}){
  return ChangePasswordState(
    changePasswordStatus: changePasswordStatus??this.changePasswordStatus,
    isTyping: isTyping??this.isTyping,
    autovalidateMode:autovalidateMode??this.autovalidateMode
  );
}
  @override
  List<Object?> get props => [changePasswordStatus,
    autovalidateMode,
    isTyping];

}