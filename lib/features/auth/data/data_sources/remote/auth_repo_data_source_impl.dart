import 'package:dio/dio.dart';
import 'package:e/core/api/api_manager.dart';
import 'package:e/core/api/end_points.dart';
import 'package:e/core/api/status_code.dart';
import 'package:e/features/auth/data/models/user_model.dart';
import 'package:e/features/auth/domain/entities/register_entity.dart';
import '../../../../../core/cache/shared_preferences.dart';
import 'auth_repo_data_source.dart';

class AuthRepoDataSourceImpl extends AuthRepoDataSource {
  final ApiManager apiManager;
  AuthRepoDataSourceImpl(this.apiManager);

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await apiManager.postData(
        endPoint: EndPoints.signIn,
        body: {"email": email, "password": password},
      );

      await CacheHelper.setData<String>('token', response.data['token']);
      if (response.statusCode == StatusCodes.success) {
        return UserModel.fromJson(response.data);
      } else if (response.statusCode == StatusCodes.serverError) {
        throw Exception("Email or password is incorrect");
      } else {
        throw Exception(
            "Unexpected error: ${response.statusCode} - ${response.data}");
      }
    } on DioException catch (e) {
      throw Exception("Network error: ${e.message}");
    }
  }



  @override
  Future<UserModel> register(RegisterEntity entity) async {
    try {
      final response = await apiManager.postData(
        endPoint: EndPoints.signUp,
        body: {
          "name": entity.fullName,
          "email": entity.email,
          "password": entity.password,
          "rePassword": entity.rePassword,
          "phone":entity.phone,
        },
      );

      if (response.statusCode == StatusCodes.success) {
        return UserModel.fromJson(response.data);
      } else if (response.statusCode == StatusCodes.serverError) {
        throw Exception("Email or phone already exists!");

      } else if (response.statusCode == 409) {
        throw Exception("Email or phone already exists!");
      } else {
        throw Exception("Unexpected error: ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == StatusCodes.serverError) {
        throw Exception("Email or phone already exists!");
      }
      throw Exception("Network error: ${e.message}");
    }
  }
}
