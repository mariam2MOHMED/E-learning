import 'package:elearning/core/result/result.dart';
import 'package:elearning/feature/profile/api/model/change_password_request.dart';
import 'package:elearning/feature/profile/api/model/change_password_response.dart';
import 'package:elearning/feature/profile/api/model/edit_profile_request.dart';
import 'package:elearning/feature/profile/data/data/profile_data_source.dart';

import 'package:elearning/feature/profile/domain/entity/user_profile.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/profile_repo.dart';
@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo{
  final ProfileDataSource _profileDataSource;
  const ProfileRepoImpl(this._profileDataSource);
  @override
  Future<Result<UserProfile>> getLoggerUserInfo()async {
   return await _profileDataSource.getLoggerUserInfo();
  }

  @override
  Future<Result<UserProfile>> editProfile(EditProfileRequest request) async{
    return await _profileDataSource.editProfile(request);
  }

  @override
  Future<Result<ChangePasswordResponse>> changePassword(ChangePasswordRequest request) async{
    return await _profileDataSource.changePassword(request);
  }

}