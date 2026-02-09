import 'package:json_annotation/json_annotation.dart';

part 'reset_code_response.g.dart';

@JsonSerializable()
class ResetCodeResponse {
  @JsonKey(name: "status")
  final String? status;

  ResetCodeResponse ({
    this.status,
  });

  factory ResetCodeResponse.fromJson(Map<String, dynamic> json) {
    return _$ResetCodeResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetCodeResponseToJson(this);
  }
}


