import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entity/user_profile.dart';
import '../repo/profile_repo.dart';

@injectable
class GetLoggedUserProfileUseCase {
  final ProfileRepo _profileRepo;

  const GetLoggedUserProfileUseCase(this._profileRepo);

  Future<Result<UserProfile>> getLoggerUserInfo() async {
    return await _profileRepo.getLoggerUserInfo();
  }
}
