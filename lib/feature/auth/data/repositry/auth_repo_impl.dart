import 'package:elearning/core/result/result.dart';
import 'package:elearning/feature/auth/api/models/forget_password/forget_password_request.dart';
import 'package:elearning/feature/auth/api/models/forget_password/forget_password_response.dart';
import 'package:elearning/feature/auth/api/models/register/register_request.dart';
import 'package:elearning/feature/auth/data/data_source/auth_data_source.dart';
import 'package:elearning/feature/auth/domain/entity/user_entity.dart';
import 'package:elearning/feature/auth/domain/repositry/auth_repo.dart';
import 'package:injectable/injectable.dart';
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

}