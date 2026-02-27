// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionDtoResponse _$QuestionDtoResponseFromJson(Map<String, dynamic> json) =>
    QuestionDtoResponse(
      message: json['message'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Questions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionDtoResponseToJson(
  QuestionDtoResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'questions': instance.questions,
};

Questions _$QuestionsFromJson(Map<String, dynamic> json) => Questions(
  Id: json['_id'] as String?,
  question: json['question'] as String?,
  answers: (json['answers'] as List<dynamic>?)
      ?.map((e) => Answers.fromJson(e as Map<String, dynamic>))
      .toList(),
  type: json['type'] as String?,
  correct: json['correct'] as String?,
  subject: json['subject'],
  exam: json['exam'] == null
      ? null
      : Exam.fromJson(json['exam'] as Map<String, dynamic>),
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$QuestionsToJson(Questions instance) => <String, dynamic>{
  '_id': instance.Id,
  'question': instance.question,
  'answers': instance.answers,
  'type': instance.type,
  'correct': instance.correct,
  'subject': instance.subject,
  'exam': instance.exam,
  'createdAt': instance.createdAt,
};

Answers _$AnswersFromJson(Map<String, dynamic> json) =>
    Answers(answer: json['answer'] as String?, key: json['key'] as String?);

Map<String, dynamic> _$AnswersToJson(Answers instance) => <String, dynamic>{
  'answer': instance.answer,
  'key': instance.key,
};
