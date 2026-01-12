import 'package:equatable/equatable.dart';
import '../../data/models/CategoryModel.dart';

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
  final String message;
  CategoryError(this.message);
  @override
  List<Object?> get props => [message];
}
