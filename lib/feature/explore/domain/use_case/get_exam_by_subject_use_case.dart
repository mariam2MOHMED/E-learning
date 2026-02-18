import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entity/exam_entity.dart';
import '../repo/explore_repo.dart';

@injectable
class GetExamBySubjectUseCase{
  final ExploreRepo _exploreRepo;
  GetExamBySubjectUseCase(this._exploreRepo);
  Future<Result<ExamEntity>> getExamBySubject(String subjectId)async{
    return await _exploreRepo.getExamBySubject(subjectId);
  }
}