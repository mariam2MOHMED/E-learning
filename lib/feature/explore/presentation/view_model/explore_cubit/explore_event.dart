sealed class ExploreEvent{
  const ExploreEvent();
}
final class GetAllSubjectEvent extends ExploreEvent{
  const GetAllSubjectEvent();
}
final class GetAllExamsEvent extends ExploreEvent{
  const GetAllExamsEvent();
}
final class GetAllQuestionsEvent extends ExploreEvent{
  final String examId;
  const GetAllQuestionsEvent(this.examId);
}
final class ExamBySubjectEvent extends ExploreEvent{
  final String subjectId;
  const ExamBySubjectEvent(this.subjectId);
}