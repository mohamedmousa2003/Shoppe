import 'package:bloc/bloc.dart';
import 'package:e/features/home/data/models/ModelCategories.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/use_cases/categorie_use_case.dart';
part '../state/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  CategoriesUseCase categoriesUseCase;
  HomeCubit(this.categoriesUseCase) : super(HomeInitial());


  Future<void> getCategories() async {
    emit(HomeLoading());
    final result = await categoriesUseCase.call();
    result.fold(
          (failure) {
        emit(HomeError(failure.message));
      }, (data) {
            emit(HomeSuccess(data));

      },
    );
  }
}
