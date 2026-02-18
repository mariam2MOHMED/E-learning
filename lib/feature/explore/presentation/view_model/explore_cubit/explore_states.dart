import 'package:elearning/feature/explore/domain/entity/exam_entity.dart';
import 'package:elearning/feature/explore/domain/entity/subject_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/enum/request_state.dart';

class ExploreState extends Equatable{
  final StateStatus<List<SubjectEntity>> subjectState;
  final StateStatus<ExamEntity> examStatus;

  const ExploreState({
    this.subjectState=const StateStatus.initial(),
    this.examStatus=const StateStatus.initial(),
  });
  ExploreState copyWith({
    StateStatus<List<SubjectEntity>>? subjectState,
    StateStatus<ExamEntity>? examStatus
  }){
    return ExploreState(

subjectState: subjectState??this.subjectState,
      examStatus:examStatus??this.examStatus
    );
  }
  @override

  List<Object?> get props => [
    subjectState,examStatus
  ];

}