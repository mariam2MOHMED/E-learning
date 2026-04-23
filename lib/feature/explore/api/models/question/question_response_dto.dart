import 'package:elearning/feature/explore/domain/entity/answer_entity.dart';
import 'package:elearning/feature/explore/domain/entity/question_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/exam_entity.dart';
import '../exams_response_dto.dart';

part 'question_response_dto.g.dart';

@JsonSerializable()
class QuestionDtoResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "questions")
  final List<Questions>? questions;

  QuestionDtoResponse ({
    this.message,
    this.questions,
  });

  factory QuestionDtoResponse.fromJson(Map<String, dynamic> json) {
    return _$QuestionDtoResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionDtoResponseToJson(this);
  }
}

@JsonSerializable()
class Questions {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "question")
  final String? question;
  @JsonKey(name: "answers")
  final List<Answers>? answers;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "correct")
  final String? correct;
  @JsonKey(name: "subject")
  final dynamic subject;
  @JsonKey(name: "exam")
  final Exam? exam;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Questions ({
    this.Id,
    this.question,
    this.answers,
    this.type,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory Questions.fromJson(Map<String, dynamic> json) {
    return _$QuestionsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionsToJson(this);
  }
  QuestionEntity toEntity() {
    return QuestionEntity(
      id: Id ?? '',
      question: question ?? '',
      answers: (answers ?? [])
          .map((e) => e.toEntity())
          .toList(),
      type: type ?? '',
      correct: correct ?? '',
      exam: exam?.toEntity() ??
          const ExamEntity(
            id: '',
            title: '',
            duration: 0,
            subjectId: '',
            numberOfQuestions: 0,
            active: false,
            createdAt: '',
          ),
    );
  }
}

@JsonSerializable()
class Answers {
  @JsonKey(name: "answer")
  final String? answer;
  @JsonKey(name: "key")
  final String? key;

  Answers ({
    this.answer,
    this.key,
  });

  factory Answers.fromJson(Map<String, dynamic> json) {
    return _$AnswersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersToJson(this);
  }
  AnswerEntity toEntity(){
    return AnswerEntity(answer: answer!, key: key!);
  }
}




