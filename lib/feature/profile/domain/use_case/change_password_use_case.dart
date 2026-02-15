import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../api/model/change_password_request.dart';
import '../../api/model/change_password_response.dart';

import '../repo/profile_repo.dart';

@injectable
class ChangePasswordUseCase  {
  final ProfileRepo _profileRepo;
  const ChangePasswordUseCase(this._profileRepo);
  Future<Result<ChangePasswordResponse>> changePassword(ChangePasswordRequest request)async{
    return await _profileRepo.changePassword(request);
  }
}
