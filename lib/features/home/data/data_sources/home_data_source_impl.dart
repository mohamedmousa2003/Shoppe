import 'package:e/core/api/api_manager.dart';
import 'package:e/features/home/data/data_sources/home_data_source.dart';
import 'package:e/features/home/data/models/ModelCategories.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/api/status_code.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl extends HomeDataSource{
  ApiManager apiManager;
  HomeDataSourceImpl(this.apiManager);
  @override
  Future<ModelCategories> getCategories() async{

    try{
      final response = await apiManager.getData(
          endPoint: EndPoints.getAllCategories
      );
      if (response.statusCode == StatusCodes.success) {
        return ModelCategories.fromJson(response.data);
      } else if (response.statusCode == StatusCodes.serverError) {
        throw Exception("Not Categories");
      } else {
        throw Exception(
            "Unexpected error: ${response.statusCode} - ${response.data}");
      }
    }catch(e){
      rethrow;
    }

  }

  @override
  Future<ModelCategories> subGetCategories(String id) async{
   try{
     final response = await apiManager.getData(endPoint: EndPoints.subCategories(id));
     if (response.statusCode == StatusCodes.success) {
       return ModelCategories.fromJson(response.data);
     } else if (response.statusCode == StatusCodes.serverError) {
       throw Exception("Not Categories");
     } else {
       throw Exception(
           "Unexpected error: ${response.statusCode} - ${response.data}");
     } }catch(e) {
     rethrow;
   }

  }

}