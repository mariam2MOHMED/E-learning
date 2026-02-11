import 'package:dio/dio.dart';
import 'package:elearning/feature/auth/api/models/forget_password/forget_password_request.dart';
import 'package:elearning/feature/auth/api/models/forget_password/forget_password_response.dart';
import 'package:elearning/feature/auth/api/models/forget_password/reset_code_request.dart';
import 'package:elearning/feature/auth/api/models/forget_password/reset_code_response.dart';
import 'package:elearning/feature/auth/api/models/forget_password/reset_password_request.dart';
import 'package:elearning/feature/auth/api/models/forget_password/reset_password_response.dart';
import 'package:elearning/feature/auth/api/models/login/login_response.dart';
import 'package:elearning/feature/auth/api/models/register/register_request.dart';
import 'package:elearning/feature/auth/api/models/register/register_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/end_point_constants.dart';
import '../models/login/login_request.dart';
part 'auth_api_services.g.dart';
@RestApi(
  baseUrl: EndPointsConstants.baseUrl
)
@injectable
abstract class AuthApiServices{
  @factoryMethod
factory AuthApiServices(Dio dio)=_AuthApiServices;
@POST(EndPointsConstants.signUpEndPoint)
  Future<RegisterResponse> register( @Body()RegisterRequest request);
  @POST(EndPointsConstants.signInEndPoint)
  Future<LoginResponse> signIn( @Body()LoginRequest request);
@POST(EndPointsConstants.forgetPassEndPoint)
  Future<ForgetPasswordReaponse>forgetPassword(@Body()
ForgetPasswordRequest request);
  @POST(EndPointsConstants.verifyCodeEndPoint)
  Future<ResetCodeResponse>verifyCode(@Body()
  ResetCodeRequest request);
  @PUT(EndPointsConstants.resetPasswordEndPoint)
  Future<ResetPasswordResponse>resetPassword(@Body()
  ResetPasswordRequest request);
}