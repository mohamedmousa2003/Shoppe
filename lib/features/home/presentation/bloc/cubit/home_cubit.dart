import 'package:bloc/bloc.dart';
import 'package:e/Di/injectable.dart';
import 'package:e/features/home/data/models/ModelCategories.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/use_cases/brands_use_case.dart';
import '../../../domain/use_cases/categorie_use_case.dart';
part '../state/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  ModelCategories? _categories;
  ModelCategories? _brands;

  Future<void> loadHomeData() async {
    emit(HomeLoading());

    final categoriesResult = await getIt<CategoriesUseCase>().call();
    final brandsResult = await getIt<BrandsUseCase>().call();

    categoriesResult.fold(
          (failure) => emit(HomeError(failure.message)),
          (categories) {
        _categories = categories;
      },
    );

    brandsResult.fold(
          (failure) => emit(HomeError(failure.message)),
          (brands) {
        _brands = brands;
      },
    );

    if (_categories != null && _brands != null) {
      emit(HomeLoaded(
        categories: _categories!,
        brands: _brands!,
      ));
    }
  }
}
