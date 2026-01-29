import 'package:dartz/dartz.dart';
import 'package:e/Di/injectable.dart';
import 'package:e/features/cart/domain/repositories/get_cart_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/failures.dart';
import '../../data/models/get_cart.dart';

@injectable
class  GetCartUseCase {
  Future<Either<AppFailures, GetCart>> call(){
    return getIt<CartRepo>().getCart();
  }
}