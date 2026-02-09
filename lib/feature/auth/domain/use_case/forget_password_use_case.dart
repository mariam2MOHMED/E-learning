import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../api/models/forget_password/forget_password_request.dart';
import '../../api/models/forget_password/forget_password_response.dart';
import '../repositry/auth_repo.dart';

@injectable
class ForgetPasswordUseCase{
  final AuthRepo _authRepo;
  const ForgetPasswordUseCase(this._authRepo);
  Future<Result<ForgetPasswordReaponse>> forgetPassword
      (ForgetPasswordRequest request)async{
    return await _authRepo.forgetPassword(request);
  }
}