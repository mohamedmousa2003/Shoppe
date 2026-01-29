import 'package:dartz/dartz.dart';
import 'package:e/core/exceptions/failures.dart';
import 'package:e/features/cart/data/models/get_cart.dart';

import '../../data/models/delete_cart.dart';

abstract interface class CartRepo {

  Future<Either<AppFailures,GetCart>> getCart();
  Future<Either<AppFailures , DeleteCart>> deleteToCart(String productID);
  Future<Either<AppFailures , DeleteCart>> upDateCountCart(String productID,int count);
}