import 'package:json_annotation/json_annotation.dart';

part 'reset_code_request.g.dart';

@JsonSerializable()
class ResetCodeRequest {
  @JsonKey(name: "resetCode")
  final String? resetCode;

  ResetCodeRequest ({
    this.resetCode,
  });

  factory ResetCodeRequest.fromJson(Map<String, dynamic> json) {
    return _$ResetCodeRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetCodeRequestToJson(this);
  }
}


