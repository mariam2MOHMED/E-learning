import 'package:elearning/core/result/result.dart';
import 'package:elearning/feature/explore/domain/entity/exam_entity.dart';
import 'package:elearning/feature/explore/domain/entity/subject_entity.dart';

abstract interface class ExploreDataSource{
  Future<Result<List<SubjectEntity>>>getAllSubjects();
  Future<Result<ExamEntity>>getExamBySubject(
      String subjectId
      );
}