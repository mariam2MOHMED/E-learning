import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../api/model/edit_profile_request.dart';
import '../entity/user_profile.dart';
import '../repo/profile_repo.dart';

@injectable
class EditProfileUseCase  {
  final ProfileRepo _profileRepo;
  const EditProfileUseCase(this._profileRepo);
  Future<Result<UserProfile>> editProfile(EditProfileRequest request)async {
    return await _profileRepo.editProfile(request);
  }
}
