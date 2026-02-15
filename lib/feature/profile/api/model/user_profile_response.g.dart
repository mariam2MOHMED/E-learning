// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileResponse _$UserProfileResponseFromJson(Map<String, dynamic> json) =>
    UserProfileResponse(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileResponseToJson(
  UserProfileResponse instance,
) => <String, dynamic>{'message': instance.message, 'user': instance.user};

User _$UserFromJson(Map<String, dynamic> json) => User(
  Id: json['_id'] as String?,
  username: json['username'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String?,
  isVerified: json['isVerified'] as bool?,
  createdAt: json['createdAt'] as String?,
  passwordResetCode: json['passwordResetCode'] as String?,
  passwordResetExpires: json['passwordResetExpires'] as String?,
  resetCodeVerified: json['resetCodeVerified'] as bool?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  '_id': instance.Id,
  'username': instance.username,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phone': instance.phone,
  'role': instance.role,
  'isVerified': instance.isVerified,
  'createdAt': instance.createdAt,
  'passwordResetCode': instance.passwordResetCode,
  'passwordResetExpires': instance.passwordResetExpires,
  'resetCodeVerified': instance.resetCodeVerified,
};
