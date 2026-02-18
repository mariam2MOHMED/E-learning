sealed class ExploreEvent{
  const ExploreEvent();
}
final class GetAllSubjectEvent extends ExploreEvent{
  const GetAllSubjectEvent();
}
final class ExamBySubjectEvent extends ExploreEvent{
  final String subjectId;
  const ExamBySubjectEvent(this.subjectId);
}