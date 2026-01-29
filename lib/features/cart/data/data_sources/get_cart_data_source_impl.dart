import 'package:e/features/cart/data/data_sources/get_cart_data_source.dart';
import 'package:e/features/cart/data/models/delete_cart.dart';
import 'package:e/features/cart/data/models/get_cart.dart';
import 'package:injectable/injectable.dart';

import '../../../../Di/injectable.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/cache/shared_preferences.dart';

@Injectable(as: GetCartDataSource)
class GetCartDataSourceImpl implements GetCartDataSource{

  ////////////////////////////////////// Token //////////////////////
  final String? token = CacheHelper.getData<String>('token');

  ////////////////////////////////////////////////// Get Cart ///////////////////
  @override
  Future<GetCart> getCart() async{
    final String? token = CacheHelper.getData<String>('token');
    try {
      final response = await getIt<ApiManager>().getData(
          endPoint: EndPoints.cart,
          headers: {
            "token" :token,
          }
      );
      if (response.statusCode == StatusCodes.success) {
        return GetCart.fromJson(response.data);
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


    //////////////////////////////////// Delete //////////////////////
    @override
    Future<DeleteCart> deleteToCart(String productID) async{
      try{
        var response =await getIt<ApiManager>().deleteData(
            endPoint: "${EndPoints.delete}/$productID",
            headers: {
              "token" :token,
            }
        );
        if (response.statusCode == StatusCodes.success) {
          return DeleteCart.fromJson(response.data);
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


  ////////////////////////////////////// Up Date Count
  @override
  Future<DeleteCart> upDateCountCart(String productID, int count) async{
    try{
      var response =await getIt<ApiManager>().upDateData(
          endPoint: "${EndPoints.delete}/$productID",
          headers: {
            "token" :token,
          },body: {
            "count":count,
      }
      );
      if (response.statusCode == StatusCodes.success) {
        return DeleteCart.fromJson(response.data);
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