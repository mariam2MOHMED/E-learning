import 'package:json_annotation/json_annotation.dart';

part 'forget_password_response.g.dart';

@JsonSerializable()
class ForgetPasswordReaponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "info")
  final String? info;

  ForgetPasswordReaponse ({
    this.message,
    this.info,
  });

  factory ForgetPasswordReaponse.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordReaponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgetPasswordReaponseToJson(this);
  }
}


