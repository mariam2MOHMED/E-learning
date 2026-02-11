import 'package:elearning/core/result/result.dart';
import 'package:elearning/feature/auth/api/models/forget_password/forget_password_request.dart';
import 'package:elearning/feature/auth/api/models/forget_password/forget_password_response.dart';
import 'package:elearning/feature/auth/api/models/forget_password/reset_code_request.dart';
import 'package:elearning/feature/auth/api/models/forget_password/reset_code_response.dart';
import 'package:elearning/feature/auth/api/models/forget_password/reset_password_request.dart';
import 'package:elearning/feature/auth/api/models/forget_password/reset_password_response.dart';
import 'package:elearning/feature/auth/api/models/login/login_request.dart';
import 'package:elearning/feature/auth/api/models/register/register_request.dart';
import 'package:elearning/feature/auth/data/data_source/auth_data_source.dart';
import 'package:elearning/feature/auth/domain/entity/user_entity.dart';
import 'package:elearning/feature/auth/domain/repositry/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/auth_entity.dart';
@Injectable(as:AuthRepo )
class AuthRepoImpl implements AuthRepo{
  final AuthDataSource _authDataSource;
  const AuthRepoImpl(this._authDataSource);
  @override
  Future<Result<UserEntity>> register(RegisterRequest request) async{
return await _authDataSource.register(request);
  }

  @override
  Future<Result<ForgetPasswordReaponse>> forgetPassword
      (ForgetPasswordRequest request)async {
return await _authDataSource.forgetPassword(request);
  }

  @override
  Future<Result<ResetCodeResponse>> verifyCode(ResetCodeRequest
  request)async {
   return await _authDataSource.verifyCode(request);
  }

  @override
  Future<Result<ResetPasswordResponse>> resetPassword(ResetPasswordRequest request) async{
    return await _authDataSource.resetPassword(request);

  }

  @override
  Future<Result<AuthEntity>> login(LoginRequest request)async {
   return await _authDataSource.login(request);
  }

}