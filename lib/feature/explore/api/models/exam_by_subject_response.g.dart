// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_by_subject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamBySubjectResponse _$ExamBySubjectResponseFromJson(
  Map<String, dynamic> json,
) => ExamBySubjectResponse(
  message: json['message'] as String?,
  exam: json['exam'] == null
      ? null
      : Exam1.fromJson(json['exam'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ExamBySubjectResponseToJson(
  ExamBySubjectResponse instance,
) => <String, dynamic>{'message': instance.message, 'exam': instance.exam};

Exam1 _$Exam1FromJson(Map<String, dynamic> json) => Exam1(
  Id: json['_id'] as String?,
  title: json['title'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  subject: json['subject'] as String?,
  numberOfQuestions: (json['numberOfQuestions'] as num?)?.toInt(),
  active: json['active'] as bool?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$Exam1ToJson(Exam1 instance) => <String, dynamic>{
  '_id': instance.Id,
  'title': instance.title,
  'duration': instance.duration,
  'subject': instance.subject,
  'numberOfQuestions': instance.numberOfQuestions,
  'active': instance.active,
  'createdAt': instance.createdAt,
};
