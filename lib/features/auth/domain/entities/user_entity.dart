import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String name;
  final String email;
  final String role;
  final String token;

  const UserEntity({
    required this.name,
    required this.email,
    required this.role,
    required this.token,
  });

  @override
  List<Object?> get props => [name, email, role, token];
}
