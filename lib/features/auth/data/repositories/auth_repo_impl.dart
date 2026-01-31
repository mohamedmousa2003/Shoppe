import 'package:dartz/dartz.dart';
import 'package:e/core/exceptions/failures.dart';
import 'package:e/features/auth/domain/entities/login_entity.dart';
import 'package:e/features/auth/domain/entities/user_entity.dart';
import 'package:e/features/auth/domain/repositories/repo_Auth.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/exception.dart';
import '../../../../core/network/check_internet_connection.dart';
import '../data_sources/remote/auth_repo_data_source.dart';
import '../mapper/user_model_mapper.dart';

@Injectable(as: RepoAuth)
class AuthRepoImpl extends RepoAuth {
  final AuthRepoDataSource authRepoDataSource;

  AuthRepoImpl(this.authRepoDataSource);

  @override
  Future<Either<AppFailures, UserEntity>> login(LoginEntity entity) async {

      bool checkInternet = await NetworkUtils.isConnected();

      try{
        final userModel =
        await authRepoDataSource.login(entity.email, entity.password);
        return Right(userModel.toEntity());
      } on AppException catch (e) {
        return Left(RemoteFailures(e.message));
      } on Exception catch (e) {
        return Left(RemoteFailures(e.toString()));
      }


  }



  @override
  Future<Either<AppFailures, UserEntity>> register(
      String name ,String email , String password , String rePassword , String phone
      ) async {
    try {
      final userModel = await authRepoDataSource.register(name, email, password, rePassword, phone);
      return Right(userModel.toEntity());
    } on AppException catch (e) {
      return Left(RemoteFailures(e.message));
    } on Exception catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
