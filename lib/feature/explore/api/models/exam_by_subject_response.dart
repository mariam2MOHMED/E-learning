import 'package:elearning/feature/explore/domain/entity/exam_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_by_subject_response.g.dart';

@JsonSerializable()
class ExamBySubjectResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "exam")
  final Exam1? exam;

  ExamBySubjectResponse ({
    this.message,
    this.exam,
  });

  factory ExamBySubjectResponse.fromJson(Map<String, dynamic> json) {
    return _$ExamBySubjectResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamBySubjectResponseToJson(this);
  }
}

@JsonSerializable()
class Exam1 {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "subject")
  final String? subject;
  @JsonKey(name: "numberOfQuestions")
  final int? numberOfQuestions;
  @JsonKey(name: "active")
  final bool? active;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Exam1 ({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory Exam1.fromJson(Map<String, dynamic> json) {
    return _$Exam1FromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$Exam1ToJson(this);
  }
  ExamEntity toEntity(){
    return ExamEntity(id: Id!, title: title!,
        duration: duration!, subjectId: subject!,
        numberOfQuestions: numberOfQuestions!,
        active: active!, createdAt: createdAt!);
  }
}


