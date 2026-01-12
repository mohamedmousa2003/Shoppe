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
  Future<Either< AppFailures,UserEntity>> call(RegisterEntity entity){
    return repoAuth.register(entity);
  }
}