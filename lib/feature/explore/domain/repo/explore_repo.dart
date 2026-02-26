
import '../../../../core/result/result.dart';
import '../entity/exam_entity.dart';
import '../entity/subject_entity.dart';

abstract interface class ExploreRepo{
  Future<Result<List<SubjectEntity>>>getAllSubjects();
  Future<Result<ExamEntity>> getExamBySubject(String subjectId);
  Future<Result<List<ExamEntity>>> getAllExams();
}