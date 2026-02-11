import 'package:elearning/feature/auth/domain/repositry/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../api/models/login/login_request.dart';
import '../entity/auth_entity.dart';

@injectable
class LoginUseCase{
  final AuthRepo _authRepo;
  const LoginUseCase(this._authRepo);
  Future<Result<AuthEntity>> login(LoginRequest request)async {
    return await _authRepo.login(request);
  }
}