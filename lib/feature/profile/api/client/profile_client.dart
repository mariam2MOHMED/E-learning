

import 'package:dio/dio.dart';
import 'package:elearning/feature/profile/api/model/change_password_request.dart';
import 'package:elearning/feature/profile/api/model/change_password_response.dart';
import 'package:elearning/feature/profile/api/model/edit_profile_request.dart';
import 'package:elearning/feature/profile/api/model/edit_profile_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/end_point_constants.dart';
import '../model/user_profile_response.dart';

part 'profile_client.g.dart';
@RestApi(
  baseUrl: EndPointsConstants.baseUrl
)
@injectable
abstract class ProfileApiServices{
  @factoryMethod
  factory ProfileApiServices(Dio dio)=_ProfileApiServices;
  @GET(EndPointsConstants.profileEndPoint)
  Future<UserProfileResponse>getLoggerUserInfo();
  @PUT(EndPointsConstants.editProfileEndPoint)
  Future<EditProfileResponse>editProfile(@Body() EditProfileRequest request);
  @PATCH(EndPointsConstants.changePasswordEndPoint)
  Future<ChangePasswordResponse>changePassword(@Body() ChangePasswordRequest request);
}
