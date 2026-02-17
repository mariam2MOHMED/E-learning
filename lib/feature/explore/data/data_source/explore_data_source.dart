import 'package:elearning/core/result/result.dart';
import 'package:elearning/feature/explore/domain/entity/subject_entity.dart';

abstract interface class ExploreDataSource{
  Future<Future<Result<List<SubjectEntity>>>>getAllSubjects();
}