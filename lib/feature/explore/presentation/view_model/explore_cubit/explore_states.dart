import 'package:elearning/feature/explore/domain/entity/exam_entity.dart';
import 'package:elearning/feature/explore/domain/entity/subject_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/enum/request_state.dart';

class ExploreState extends Equatable{
  final StateStatus<List<SubjectEntity>> subjectState;
  final StateStatus<ExamEntity> examStatus;
  final StateStatus<List<ExamEntity>> examsListStatus;
  const ExploreState({
    this.subjectState=const StateStatus.initial(),
    this.examStatus=const StateStatus.initial(),
    this.examsListStatus=const StateStatus.initial(),
  });
  ExploreState copyWith({
    StateStatus<List<SubjectEntity>>? subjectState,
    StateStatus<ExamEntity>? examStatus,
    StateStatus<List<ExamEntity>>? examsListStatus
  }){
    return ExploreState(

subjectState: subjectState??this.subjectState,
      examStatus:examStatus??this.examStatus,
      examsListStatus: examsListStatus??this.examsListStatus
    );
  }
  @override

  List<Object?> get props => [
    subjectState,examStatus,examsListStatus
  ];

}