import 'package:elearning/core/enum/request_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entity/user_profile.dart';

class ProfileStates extends Equatable {
  final StateStatus<UserProfile> profileStatus;
  final StateStatus<UserProfile> editProfileStatus;
  final AutovalidateMode editAutouvalidateMode;

  const ProfileStates({
    this.profileStatus = const StateStatus.initial(),
    this.editProfileStatus = const StateStatus.initial(),
    this.editAutouvalidateMode = AutovalidateMode.disabled,
  });

  ProfileStates copyWith({
    StateStatus<UserProfile>? profileStatus,
    StateStatus<UserProfile>? editProfileStatus,
    AutovalidateMode? editAutouvalidateMode,
  }) {
    return ProfileStates(
      profileStatus: profileStatus ?? this.profileStatus,
      editProfileStatus: editProfileStatus ?? this.editProfileStatus,
      editAutouvalidateMode:
          editAutouvalidateMode ?? this.editAutouvalidateMode,
    );
  }

  @override
  List<Object?> get props => [
    profileStatus,
    editProfileStatus,
    editAutouvalidateMode,
  ];
}
