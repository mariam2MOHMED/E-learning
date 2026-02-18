import 'package:elearning/feature/explore/domain/entity/exam_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_by_subject_response.g.dart';

@JsonSerializable()
class ExamBySubjectResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "exam")
  final Exam? exam;

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
class Exam {
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

  Exam ({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return _$ExamFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamToJson(this);
  }
  ExamEntity toEntity(){
    return ExamEntity(id: Id!, title: title!,
        duration: duration!, subjectId: subject!,
        numberOfQuestions: numberOfQuestions!,
        active: active!, createdAt: createdAt!);
  }
}


