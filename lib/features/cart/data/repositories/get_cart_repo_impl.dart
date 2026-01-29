import 'package:dartz/dartz.dart';
import 'package:e/Di/injectable.dart';
import 'package:e/core/exceptions/failures.dart';
import 'package:e/features/cart/data/models/get_cart.dart';
import 'package:e/features/cart/domain/repositories/get_cart_repo.dart';
import 'package:e/features/cart/data/models/delete_cart.dart';
import 'package:injectable/injectable.dart';
import '../data_sources/get_cart_data_source.dart';

@Injectable(as: CartRepo)
class GetCartRepoImpl implements CartRepo {

  /////////////////////////////////////// Get Cart ////////////////////////////
  @override
  Future<Either<AppFailures, GetCart>> getCart()async {

    try{
      final cart =await getIt<GetCartDataSource>().getCart();
      return right(cart);
    }catch(e){
      return Left(RemoteFailures(e.toString()));
    }
  }

  ///////////////////////////////////// Delete ///////////////////
  @override
  Future<Either<AppFailures, DeleteCart>> deleteToCart(String productID) async{
    try{
      final cart =await getIt<GetCartDataSource>().deleteToCart(productID);
      return right(cart);
    }catch(e){
      return Left(RemoteFailures(e.toString()));
    }
  }

  ////////////////////////////////////// Up Date Counter ///////////////
  @override
  Future<Either<AppFailures, DeleteCart>> upDateCountCart(String productID, int count)async {
   try{
     final upDateCount =await getIt<GetCartDataSource>().upDateCountCart(productID, count);
     return right(upDateCount);
   }catch(e){
     return Left(RemoteFailures(e.toString()));
   }
  }


}
