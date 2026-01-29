import 'package:dartz/dartz.dart';
import 'package:e/Di/injectable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/failures.dart';
import '../../data/models/delete_cart.dart';
import '../repositories/get_cart_repo.dart';

@injectable
class UpDateCountUseCase {
  Future<Either<AppFailures, DeleteCart>> call(String productID ,int count){
    return getIt<CartRepo>().upDateCountCart(productID, count);
  }
}