import 'package:elearning/core/enum/request_state.dart';
import 'package:elearning/feature/auth/api/models/forget_password/forget_password_response.dart';
import 'package:equatable/equatable.dart';

class ForgetPasswordState extends Equatable{
final StateStatus<ForgetPasswordReaponse>forgetPasswordRequest;
const ForgetPasswordState({this.forgetPasswordRequest=
const StateStatus.initial()});
ForgetPasswordState copyWith({
  StateStatus<ForgetPasswordReaponse>?forgetPasswordRequest
}){
  return ForgetPasswordState(
  forgetPasswordRequest: forgetPasswordRequest??this.forgetPasswordRequest
  );
}
  @override
  List<Object?> get props => [forgetPasswordRequest];
}