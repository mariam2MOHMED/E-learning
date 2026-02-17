import 'package:elearning/feature/explore/domain/repo/explore_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';

import '../entity/subject_entity.dart';

@injectable
class GetAllSubjectsUseCase {
  final ExploreRepo _exploreRepo;

  const GetAllSubjectsUseCase(this._exploreRepo);

Future<Result<List<SubjectEntity>>> getAllSubjects() async {
    return await _exploreRepo.getAllSubjects();
  }

}