import 'package:elearning/core/result/result.dart';
import 'package:elearning/core/safe_api_call/safe_api_call.dart';
import 'package:elearning/feature/auth/api/client/auth_api_services.dart';

import 'package:elearning/feature/auth/api/models/register/register_request.dart';

import 'package:elearning/feature/auth/domain/entity/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/auth_data_source.dart';
@Injectable(as:AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource{
  final AuthApiServices _authApiServices;
  AuthDataSourceImpl(this._authApiServices);
  @override
  Future<Result<UserEntity>> register(RegisterRequest request ) async{
return safeCall(()async{
  final user=await _authApiServices.register(request);
  return user.user!.toEntity();

});
  }
}