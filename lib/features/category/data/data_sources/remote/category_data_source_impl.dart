import 'package:e/core/api/api_manager.dart';
import 'package:e/core/api/end_points.dart';
import 'package:e/features/category/data/models/CategoryModel.dart';
import 'package:e/Di/injectable.dart';
import 'package:e/features/category/data/models/add_to_cart.dart';
import 'package:e/features/cart/data/models/delete_cart.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/api/status_code.dart';
import '../../../../../core/cache/shared_preferences.dart';
import 'category_data_source.dart';

@Injectable(as: CategoryDataSource)
class CategoryDataSourceImpl extends CategoryDataSource{
  final String? token = CacheHelper.getData<String>('token');

  @override
  Future<CategoryModel> getCategory() async{
    try{
      final response = await getIt<ApiManager>().getData(endPoint: EndPoints.getAllProducts);
      if (response.statusCode == StatusCodes.success) {
        return CategoryModel.fromJson(response.data);
      } else if (response.statusCode == StatusCodes.serverError) {
        throw Exception("Not Categories");
      } else {
        throw Exception(
            "Unexpected error: ${response.statusCode} - ${response.data}");
      }
    } catch(e){
      rethrow;
    }
  }


  ////////////////////////////////////// Add To Cart /////////////////////
  @override
  Future<AddToCart> addToCart(String productId) async{
    try{
      final response = await getIt<ApiManager>().postData(
          endPoint: EndPoints.addCart,
        body: {
           "productId": productId
        },
        headers: {
            "token" :token,
        }
      );
      if (response.statusCode == StatusCodes.success) {
        return AddToCart.fromJson(response.data);
      } else if (response.statusCode == StatusCodes.serverError) {
        throw Exception("Not Categories");
      } else {
        throw Exception(
            "Unexpected error: ${response.statusCode} - ${response.data}");
      }
    } catch(e){
      rethrow;
    }
  }



}