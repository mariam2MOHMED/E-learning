import 'package:elearning/core/enum/request_state.dart';
import 'package:elearning/core/error/response_exceptions.dart';
import 'package:elearning/feature/explore/domain/entity/subject_entity.dart';
import 'package:elearning/feature/explore/domain/use_case/get_all_subjects_use_case.dart';
import 'package:elearning/feature/explore/presentation/view_model/explore_cubit/explore_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/result/result.dart';
import 'explore_event.dart';
@injectable
class ExploreCubit extends Cubit<ExploreState>{
  ExploreCubit(this._allSubjectsUseCase):super(const ExploreState());
  final GetAllSubjectsUseCase _allSubjectsUseCase;
  Future<void>doIntent({required ExploreEvent intent})async{
    switch(intent){

      case GetAllSubjectEvent():
     _getAllSubjects();
    }
  }
void _getAllSubjects() async {
    emit(state.copyWith(
      subjectState: const StateStatus.loading()
    ));
    final result=await _allSubjectsUseCase.getAllSubjects();
    switch(result){


      case SuccessResult<List<SubjectEntity>>():
        emit(state.copyWith(
            subjectState:  StateStatus.success(result.successResult)
        ));
      case FailedResult<List<SubjectEntity>>():
        emit(state.copyWith(
            subjectState:  StateStatus.failure(
                ResponseException(message: result.error))
        ));
    }
}
}