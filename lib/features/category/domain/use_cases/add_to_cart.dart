import 'package:dartz/dartz.dart';
import 'package:e/Di/injectable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/failures.dart';
import '../../data/models/add_to_cart.dart';
import '../repositories/category_repo.dart';

@injectable
class AddToCartUseCase {
  Future<Either<AppFailures,AddToCart>> call(String productId){
    return getIt<CategoryRepo>().addToCartRepo(productId);
  }
}