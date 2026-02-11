import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../api/models/forget_password/reset_password_request.dart';
import '../../api/models/forget_password/reset_password_response.dart';
import '../repositry/auth_repo.dart';
@injectable
class ResetPasswordUseCase{
  final AuthRepo _authRepo;
  const ResetPasswordUseCase(this._authRepo);
  Future<Result<ResetPasswordResponse>> resetPassword
      (ResetPasswordRequest request)async{
    return await _authRepo.resetPassword(request);
  }

}