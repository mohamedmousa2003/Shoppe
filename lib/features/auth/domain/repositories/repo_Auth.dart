import 'package:dartz/dartz.dart';
import 'package:e/core/exceptions/failures.dart';
import 'package:e/features/auth/domain/entities/register_entity.dart';
import '../entities/login_entity.dart';
import '../entities/user_entity.dart';

abstract class RepoAuth {

  Future<Either< AppFailures,UserEntity>> login(LoginEntity entity);
  Future<Either< AppFailures,UserEntity>> register(
      String name ,String email , String password , String rePassword , String phone
      );

}