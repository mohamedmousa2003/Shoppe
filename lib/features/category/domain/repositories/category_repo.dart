import 'package:dartz/dartz.dart';
import 'package:e/core/exceptions/failures.dart';
import '../../data/models/CategoryModel.dart';
import '../../data/models/add_to_cart.dart';
import '../../../cart/data/models/delete_cart.dart';

abstract class CategoryRepo {
  Future<Either<AppFailures , CategoryModel>> getCategoryRepo();
  Future<Either<AppFailures , AddToCart>> addToCartRepo(String productId);

}