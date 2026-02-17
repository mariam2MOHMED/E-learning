import 'package:elearning/core/safe_api_call/safe_api_call.dart';
import 'package:elearning/feature/explore/api/client/explore_services.dart';
import 'package:elearning/feature/explore/domain/entity/subject_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../data/data_source/explore_data_source.dart';
@Injectable(as:ExploreDataSource )
class ExploreDataSourceImpl implements   ExploreDataSource{
  final ExploreServices _exploreServices;
  const ExploreDataSourceImpl(this._exploreServices);
  @override
  Future<Future<Result<List<SubjectEntity>>>>getAllSubjects()
async {
return safeCall(()async{
  final subjects=await _exploreServices.getAllSubjects();
  return subjects.subjects?.map((e)=>e.toEntity()).toList()??[];
});
  }

}