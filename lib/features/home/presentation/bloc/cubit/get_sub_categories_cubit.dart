import 'package:e/features/home/domain/use_cases/sub_get_categories_use_case.dart';
import 'package:e/features/home/presentation/bloc/state/get_sub_categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubCategoriesCubit extends Cubit<GetSubCategoriesState>{
  SubGetCategoriesUseCase subGetCategoriesUseCase;
  GetSubCategoriesCubit(this.subGetCategoriesUseCase):super(GetSubCategoriesInitial());
  Future<void> getCategories(String id) async {
    emit(GetSubCategoriesLoading());
    final result = await subGetCategoriesUseCase.call(id);
    result.fold(
          (failure) {
        emit(GetSubCategoriesError(failure.message));
      }, (data) {
      emit(GetSubCategoriesSuccess(data));
    },
    );
  }

}