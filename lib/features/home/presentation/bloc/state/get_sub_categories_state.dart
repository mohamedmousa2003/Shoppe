import 'package:equatable/equatable.dart';

import '../../../data/models/ModelCategories.dart';

abstract class GetSubCategoriesState extends Equatable{
  @override
  List<Object?> get props => [];
}


final class GetSubCategoriesInitial extends GetSubCategoriesState {

}

final class GetSubCategoriesLoading extends GetSubCategoriesState {}


class GetSubCategoriesSuccess extends GetSubCategoriesState {
  final ModelCategories products;
  GetSubCategoriesSuccess(this.products);
  @override
  List<Object?> get props => [products];
}


final class GetSubCategoriesEmpty extends GetSubCategoriesState {}


final class GetSubCategoriesError extends GetSubCategoriesState {
  final String message;
  GetSubCategoriesError(this.message);
  @override
  List<Object?> get props => [message];
}
