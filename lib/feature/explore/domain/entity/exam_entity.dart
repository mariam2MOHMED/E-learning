import 'package:equatable/equatable.dart';

class ExamEntity extends Equatable {
  final String id;
  final String title;
  final int duration;
  final String subjectId;
  final int numberOfQuestions;
  final bool active;
  final String createdAt;

  const ExamEntity({
    required this.id,
    required this.title,
    required this.duration,
    required this.subjectId,
    required this.numberOfQuestions,
    required this.active,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    duration,
    subjectId,
    numberOfQuestions,
    active,
    createdAt,
  ];
}
