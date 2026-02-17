import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable {
  final String id;
  final String name;
  final String icon;
  final String createdAt;

  const SubjectEntity({
    required this.id,
    required this.name,
    required this.icon,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, icon, createdAt];
}