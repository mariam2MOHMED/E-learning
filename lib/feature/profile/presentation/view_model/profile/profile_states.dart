import 'package:elearning/core/enum/request_state.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/user_profile.dart';
class ProfileStates extends Equatable {
final StateStatus<UserProfile>profileStatus;
final StateStatus<UserProfile>editProfileStatus;

const ProfileStates ({
  this.profileStatus=const StateStatus.initial(),
  this.editProfileStatus=const StateStatus.initial(),
});
ProfileStates copyWith({
  StateStatus<UserProfile>?profileStatus,
  StateStatus<UserProfile>?editProfileStatus
}){
  return ProfileStates(
  profileStatus: profileStatus??this.profileStatus,
    editProfileStatus: editProfileStatus??this.editProfileStatus
  );
}
  @override
  List<Object?> get props => [profileStatus,editProfileStatus];


}
