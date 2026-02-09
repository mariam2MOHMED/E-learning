import '../../../../core/result/result.dart';
import '../../api/models/forget_password/forget_password_request.dart';
import '../../api/models/forget_password/forget_password_response.dart';
import '../../api/models/forget_password/reset_code_request.dart';
import '../../api/models/forget_password/reset_code_response.dart';
import '../../api/models/register/register_request.dart';
import '../entity/user_entity.dart';

abstract interface class AuthRepo{
  Future<Result<UserEntity>>register(RegisterRequest request);
  Future<Result<ForgetPasswordReaponse>> forgetPassword
      (ForgetPasswordRequest request);
  Future<Result<ResetCodeResponse>> verifyCode(ResetCodeRequest request);
}