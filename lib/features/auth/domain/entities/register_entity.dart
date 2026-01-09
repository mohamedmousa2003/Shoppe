import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String fullName;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  const RegisterEntity(
      {required this.fullName,required this.email,required this.password,required this.phone,required this.rePassword});

  @override
  List<Object?> get props => [fullName, email, password, phone,rePassword];
}
