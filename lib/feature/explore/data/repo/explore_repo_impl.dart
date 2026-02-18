import 'package:elearning/core/result/result.dart';
import 'package:elearning/feature/explore/data/data_source/explore_data_source.dart';
import 'package:elearning/feature/explore/domain/entity/exam_entity.dart';

import 'package:elearning/feature/explore/domain/entity/subject_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/explore_repo.dart';
@Injectable(as: ExploreRepo)
class ExploreRepoImpl implements   ExploreRepo{
 final ExploreDataSource _dataSource;
 const ExploreRepoImpl(this._dataSource);
  @override
Future<Result<List<SubjectEntity>>> getAllSubjects() async{
   return await _dataSource.getAllSubjects();
  }

  @override
  Future<Result<ExamEntity>> getExamBySubject(String subjectId) async {
return await _dataSource.getExamBySubject(subjectId);
  }


}