import 'package:equatable/equatable.dart';

import 'answer_entity.dart';
import 'exam_entity.dart';
class QuestionEntity extends Equatable {
  final String id;
  final String question;
  final List<AnswerEntity> answers;
  final String type;
  final String correct;
  final ExamEntity exam;

  const QuestionEntity({
    required this.id,
    required this.question,
    required this.answers,
    required this.type,
    required this.correct,
    required this.exam,
  });

  @override
  List<Object?> get props => [
    id,
    question,
    answers,
    type,
    correct,
    exam,
  ];
}