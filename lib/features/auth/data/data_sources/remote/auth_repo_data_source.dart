import '../../../domain/entities/register_entity.dart';
import '../../models/user_model.dart';

abstract class AuthRepoDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(RegisterEntity entity);
}
