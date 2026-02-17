import 'package:elearning/feature/explore/domain/entity/subject_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/enum/request_state.dart';

class ExploreState extends Equatable{
  final StateStatus<List<SubjectEntity>> subjectState;

  const ExploreState({
    this.subjectState=const StateStatus.initial(),

  });
  ExploreState copyWith({
    StateStatus<List<SubjectEntity>>? subjectState
  }){
    return ExploreState(

subjectState: subjectState??this.subjectState
    );
  }
  @override

  List<Object?> get props => [
    subjectState
  ];

}