import 'package:elearning/feature/auth/domain/repositry/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../api/models/register/register_request.dart';
import '../entity/user_entity.dart';

@injectable
class RegisterUseCase{
  final AuthRepo _authRepo;
  const RegisterUseCase(this._authRepo);
  Future<Result<UserEntity>>register(RegisterRequest request)async{
    return await _authRepo.register(request);
  }
}