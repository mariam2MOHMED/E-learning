import 'package:elearning/core/enum/request_state.dart';
import 'package:elearning/feature/auth/domain/entity/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

//
class RegisterState extends Equatable {
  final StateStatus<UserEntity> registerStatus;
  final AutovalidateMode autovalidateMode;
  final bool isValid;

  const RegisterState({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.isValid = false,
    this.registerStatus = const StateStatus.initial(),
  });

  @override
  RegisterState copyWith({
    bool? isValid,
    StateStatus<UserEntity>? registerStatus,
    AutovalidateMode? autovalidateMode,
  }) {
    return RegisterState(
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      registerStatus: registerStatus ?? this.registerStatus,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [registerStatus, autovalidateMode, isValid];
}
