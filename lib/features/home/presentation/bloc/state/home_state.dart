part of '../cubit/home_cubit.dart';

abstract class HomeState extends Equatable{
  @override
  List<Object?> get props => [];
}


final class HomeInitial extends HomeState {

}

final class HomeLoading extends HomeState {}


class HomeLoaded extends HomeState {
  final ModelCategories categories;
  final ModelCategories brands;

  HomeLoaded({
    required this.categories,
    required this.brands,
  });

  @override
  List<Object?> get props => [categories, brands];
}


final class HomeEmpty extends HomeState {}


final class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
  @override
  List<Object?> get props => [message];
}
