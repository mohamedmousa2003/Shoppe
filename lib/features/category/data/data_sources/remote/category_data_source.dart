import 'package:e/features/category/data/models/CategoryModel.dart';

import '../../models/add_to_cart.dart';
import '../../../../cart/data/models/delete_cart.dart';

abstract class CategoryDataSource {
  Future<CategoryModel> getCategory();
  Future<AddToCart> addToCart(String productId);

}
