import 'package:elearning/core/result/result.dart';
import 'package:elearning/feature/auth/api/models/forget_password/forget_password_request.dart';
import 'package:elearning/feature/auth/api/models/forget_password/forget_password_response.dart';
import 'package:elearning/feature/auth/api/models/forget_password/reset_code_request.dart';
import 'package:elearning/feature/auth/api/models/forget_password/reset_code_response.dart';
import 'package:elearning/feature/auth/api/models/login/login_request.dart';
import 'package:elearning/feature/auth/api/models/register/register_request.dart';
import 'package:elearning/feature/auth/domain/entity/user_entity.dart';

import '../../api/models/forget_password/reset_password_request.dart';
import '../../api/models/forget_password/reset_password_response.dart';
import '../../domain/entity/auth_entity.dart';

abstract interface class AuthDataSource{
  Future<Result<UserEntity>>register(RegisterRequest request);
Future<Result<ForgetPasswordReaponse>>forgetPassword(ForgetPasswordRequest request);
  Future<Result<ResetCodeResponse>>verifyCode
      (ResetCodeRequest request);
  Future<Result<ResetPasswordResponse>>resetPassword(
  ResetPasswordRequest request);
  Future<Result<AuthEntity>>login(LoginRequest request);

}
