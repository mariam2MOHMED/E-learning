import 'package:elearning/feature/auth/api/models/forget_password/reset_code_request.dart';
import 'package:elearning/feature/auth/api/models/forget_password/reset_code_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../repositry/auth_repo.dart';

@injectable
class VerifyCodeUseCase{
  final AuthRepo _authRepo;
  const VerifyCodeUseCase(this._authRepo);
  Future<Result<ResetCodeResponse>>verifyCode(ResetCodeRequest request)async{
    return await _authRepo.verifyCode(request);
  }
}