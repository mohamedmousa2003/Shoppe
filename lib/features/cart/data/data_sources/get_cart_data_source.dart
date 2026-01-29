import 'package:e/features/cart/data/models/get_cart.dart';

import '../models/delete_cart.dart';

abstract class GetCartDataSource {
  Future<GetCart> getCart();
  Future<DeleteCart> deleteToCart(String productID);
  Future<DeleteCart> upDateCountCart(String productID,int count);
}