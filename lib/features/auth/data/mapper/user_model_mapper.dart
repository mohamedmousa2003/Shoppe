import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

extension UserModelMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      name: user?.name ?? '',
      email: user?.email ?? '',
      role: user?.role ?? '',
      token: token ?? '',
    );
  }
}
