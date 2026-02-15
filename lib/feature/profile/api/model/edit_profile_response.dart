import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/user_profile.dart';

part 'edit_profile_response.g.dart';

@JsonSerializable()
class EditProfileResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final User? user;

  EditProfileResponse ({
    this.message,
    this.user,
  });

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) {
    return _$EditProfileResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EditProfileResponseToJson(this);
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "passwordResetCode")
  final String? passwordResetCode;
  @JsonKey(name: "passwordResetExpires")
  final String? passwordResetExpires;
  @JsonKey(name: "resetCodeVerified")
  final bool? resetCodeVerified;

  User ({
    this.Id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.password,
    this.isVerified,
    this.createdAt,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
  UserProfile toEntity() {
    return UserProfile(
      id: Id!,
      username: username!,
      firstName: firstName!,
      lastName: lastName!,
      email: email!,
      phone: phone!,
      role: role!,
      isVerified: isVerified!,
      createdAt: createdAt!,
    );
  }
}


