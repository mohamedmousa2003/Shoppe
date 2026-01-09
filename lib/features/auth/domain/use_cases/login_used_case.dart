import 'package:dartz/dartz.dart';
import 'package:e/features/auth/domain/entities/user_entity.dart';
import 'package:e/features/auth/domain/repositories/repo_Auth.dart';
import '../../../../core/exceptions/failures.dart';
import '../entities/login_entity.dart';

class LoginUsedCase {

  final RepoAuth repoAuth;

  LoginUsedCase({required this.repoAuth});

  Future<Either< AppFailures,UserEntity>> call(LoginEntity entity) {
    return repoAuth.login(entity);
  }

}
