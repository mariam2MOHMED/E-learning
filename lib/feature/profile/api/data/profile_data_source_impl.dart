import 'package:elearning/core/result/result.dart';
import 'package:elearning/core/safe_api_call/safe_api_call.dart';
import 'package:elearning/feature/profile/api/client/profile_client.dart';
import 'package:elearning/feature/profile/api/model/change_password_request.dart';
import 'package:elearning/feature/profile/api/model/change_password_response.dart';
import 'package:elearning/feature/profile/api/model/edit_profile_request.dart';

import 'package:elearning/feature/profile/domain/entity/user_profile.dart';
import 'package:injectable/injectable.dart';

import '../../data/data/profile_data_source.dart';
@Injectable(as: ProfileDataSource)
class ProfileDataSourceImpl implements ProfileDataSource{
  final ProfileApiServices _profileApiServices;
  const ProfileDataSourceImpl(this._profileApiServices);
  @override
  Future<Result<UserProfile>> getLoggerUserInfo() async{
return safeCall(()async{
  final user=await _profileApiServices.getLoggerUserInfo();
  return user.user!.toEntity();
});

  }

  @override
  Future<Result<UserProfile>> editProfile(EditProfileRequest request) async{
    return safeCall(()async{
      final user=await _profileApiServices.editProfile(request);
      return user.user!.toEntity();
    });
  }

  @override
  Future<Result<ChangePasswordResponse>> changePassword(ChangePasswordRequest request)async {
    return safeCall(()async{

      return await _profileApiServices.changePassword(request);
    });
  }

}