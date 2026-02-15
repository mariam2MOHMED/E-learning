import 'package:elearning/feature/profile/api/model/change_password_request.dart';
import 'package:elearning/feature/profile/api/model/change_password_response.dart';
import 'package:elearning/feature/profile/api/model/edit_profile_request.dart';

import '../../../../core/result/result.dart';
import '../../domain/entity/user_profile.dart';

abstract interface class  ProfileDataSource{
  Future<Result<UserProfile>>getLoggerUserInfo();
  Future<Result<UserProfile>>editProfile(EditProfileRequest request);
  Future<Result<ChangePasswordResponse>>changePassword(ChangePasswordRequest request);

}