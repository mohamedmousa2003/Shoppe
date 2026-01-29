import 'package:e/core/exceptions/failures.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/CategoryModel.dart';
import '../../data/models/add_to_cart.dart';
import '../../../cart/data/models/delete_cart.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState {}
class CategorySuccess extends CategoryState {
  final CategoryModel products;
  CategorySuccess(this.products);
  @override
  List<Object?> get props => [products];
}
final class CategoryEmpty extends CategoryState {}
final class CategoryError extends CategoryState {
  final AppFailures message;
  CategoryError(this.message);
  @override
  List<Object?> get props => [message];
}


/////////////////////// Add To Cart ////////////////////////

final class AddCartLoading extends CategoryState{}
final class AddCartSuccess extends CategoryState{
  final AddToCart cart;
  AddCartSuccess(this.cart);
  @override
  List<Object?> get props => [cart];
}
final class AddCartError extends CategoryState{
  final AppFailures message;
  AddCartError(this.message);
  @override
  List<Object?> get props => [message];
}


