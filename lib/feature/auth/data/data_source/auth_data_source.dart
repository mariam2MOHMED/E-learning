import 'package:elearning/core/result/result.dart';
import 'package:elearning/feature/auth/api/models/register/register_request.dart';
import 'package:elearning/feature/auth/domain/entity/user_entity.dart';

abstract interface class AuthDataSource{
  Future<Result<UserEntity>>register(RegisterRequest request);
}