import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String message;
  final String token;
  final ClientEntity user;

  const AuthEntity({
    required this.message,
    required this.token,
    required this.user,
  });

  @override
  List<Object?> get props => [message, token, user];
}


class ClientEntity extends Equatable {
  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String role;
  final bool isVerified;

  const ClientEntity({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    required this.isVerified,
  });

  @override
  List<Object?> get props => [
    id,
    username,
    firstName,
    lastName,
    email,
    phone,
    role,
    isVerified,
  ];
}
