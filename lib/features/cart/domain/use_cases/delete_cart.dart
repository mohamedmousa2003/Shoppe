
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../Di/injectable.dart';
import '../../../../core/exceptions/failures.dart';
import '../../data/models/delete_cart.dart';
import '../repositories/get_cart_repo.dart';

@injectable
class DeleteCartUseCase {
  Future<Either<AppFailures , DeleteCart>> call(String productID){
    return  getIt<CartRepo>().deleteToCart(productID);
  }
}