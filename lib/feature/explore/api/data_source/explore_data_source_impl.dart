import 'package:elearning/core/safe_api_call/safe_api_call.dart';
import 'package:elearning/feature/explore/api/client/explore_services.dart';
import 'package:elearning/feature/explore/domain/entity/exam_entity.dart';
import 'package:elearning/feature/explore/domain/entity/question_entity.dart';
import 'package:elearning/feature/explore/domain/entity/subject_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../data/data_source/explore_data_source.dart';
@Injectable(as:ExploreDataSource )
class ExploreDataSourceImpl implements   ExploreDataSource{
  final ExploreServices _exploreServices;
  const ExploreDataSourceImpl(this._exploreServices);
  @override
  Future<Result<List<SubjectEntity>>>getAllSubjects()
async {
return safeCall(()async{
  final response=await _exploreServices.getAllSubjects();
  return response.subjects?.map((e)=>e.toEntity()).toList()??[];
});
  }

  @override
  Future<Result<ExamEntity>> getExamBySubject(String subjectId)async {
    return safeCall(()async{
      final response=await _exploreServices.getExamBySubject(subjectId);
      return response.exam!.toEntity();
    });
  }

  @override
  Future<Result<List<ExamEntity>>> getAllExams() {
    return safeCall(()async{
      final response=await _exploreServices.getAllExams();
      return response.exams!.map((e)=>e.toEntity()).toList();
    });
  }

  @override
  Future<Result<List<QuestionEntity>>> getAllQuestions(String examId)async {
   return safeCall(()async{
     final response =await _exploreServices.getAllQuestions(examId);
     return response.questions!.map((e)=>e.toEntity()).toList();
   });
  }

}