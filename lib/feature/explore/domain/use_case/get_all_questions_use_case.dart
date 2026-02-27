
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entity/question_entity.dart';
import '../repo/explore_repo.dart';
@injectable
class GetAllQuestionsUseCase{
  final ExploreRepo _exploreRepo;
  const GetAllQuestionsUseCase(this._exploreRepo);
  Future<Result<List<QuestionEntity>>> getAllQuestions(String examId)async{
    return await _exploreRepo.getAllQuestions(examId);
  }
}