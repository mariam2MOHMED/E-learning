import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entity/exam_entity.dart';
import '../repo/explore_repo.dart';

@injectable
class GetAllExamsUseCase{
  final ExploreRepo _exploreRepo;
  const GetAllExamsUseCase(this._exploreRepo);
  Future<Result<List<ExamEntity>>> getAllExams()async{
    return await _exploreRepo.getAllExams();

  }
}