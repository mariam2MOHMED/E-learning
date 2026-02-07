import '../../../../core/result/result.dart';
import '../../api/models/register/register_request.dart';
import '../entity/user_entity.dart';

abstract interface class AuthRepo{
  Future<Result<UserEntity>>register(RegisterRequest request);
}