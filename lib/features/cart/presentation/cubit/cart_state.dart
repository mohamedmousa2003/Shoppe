import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/exceptions/failures.dart';
import '../../data/models/delete_cart.dart';
import '../../data/models/get_cart.dart';

@immutable
sealed class CartState extends Equatable{
  @override
  List<Object?> get props => [];
}

/////////////////////////////////////// Get cart /////////////////////
final class GetCartInitial extends CartState {}
final class GetCartLoading extends CartState {}
final class GetCartSuccess extends CartState {
  final GetCart getCart;
  GetCartSuccess(this.getCart);
  @override
  List<Object?> get props => [getCart];
}
final class GetCartError extends CartState {
  final AppFailures message;
  GetCartError(this.message);
  @override
  List<Object?> get props => [message];
}


////////////////////////////////// Delete To Cart ////////////////
final class DeleteCartLoading extends CartState{}
final class DeleteCartSuccess extends CartState{
  final DeleteCart delete;
  DeleteCartSuccess({required this.delete});
  @override
  List<Object?> get props => [delete];
}
final class DeleteCartError extends CartState{
  final AppFailures message;
  DeleteCartError(this.message);
  @override
  List<Object?> get props => [message];
}

////////////////////////////////// UpDate Count ////////////////
final class UpDateCountLoading extends CartState{}
final class UpDateCountSuccess extends CartState{
  final DeleteCart delete;
  UpDateCountSuccess({required this.delete});
  @override
  List<Object?> get props => [delete];
}
final class UpDateCountError extends CartState{
  final AppFailures message;
  UpDateCountError(this.message);
  @override
  List<Object?> get props => [message];
}