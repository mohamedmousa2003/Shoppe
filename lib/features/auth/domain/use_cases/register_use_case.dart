import 'package:dartz/dartz.dart';
import 'package:e/features/auth/domain/entities/register_entity.dart';
import 'package:e/features/auth/domain/entities/user_entity.dart';
import 'package:e/features/auth/domain/repositories/repo_Auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/failures.dart';
@injectable
class RegisterUseCase {
  final RepoAuth repoAuth ;
  RegisterUseCase({required this.repoAuth});
  Future<Either< AppFailures,UserEntity>> call(String name ,String email , String password , String rePassword , String phone
      ){
    return repoAuth.register(name, email, password, rePassword, phone);
  }
}