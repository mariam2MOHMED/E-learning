import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entity/subject_entity.dart';

abstract interface class ExploreRepo{
  Future<Future<Result<List<SubjectEntity>>>>getAllSubjects();
}