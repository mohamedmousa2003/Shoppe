import 'package:bloc/bloc.dart';
import 'package:e/Di/injectable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/failures.dart';
import '../../domain/use_cases/delete_cart.dart';
import '../../domain/use_cases/get_cart_use_case.dart';
import '../../domain/use_cases/up_date_count_use_case.dart';
import 'cart_state.dart';
@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(GetCartInitial());

  getCart()async{
    emit(GetCartLoading());
    final cart=await getIt<GetCartUseCase>().call();
    cart.fold(
          (failure) {
        emit(GetCartError(RemoteFailures(failure.message)));
      }, (data) {
      emit(GetCartSuccess(data));
    },
    );
  }

  //////////////////////////// Delete To Cart //////////////////
  void deleteProduct({required String cartItemId}) async {
    emit(DeleteCartLoading());

    final result =
    await getIt<DeleteCartUseCase>().call(cartItemId);

    result.fold(
          (failure) {
        emit(DeleteCartError(RemoteFailures(failure.message)));
      },
          (data) {
        getCart();
      },
    );
  }


  //////////////////////////// Delete To Cart //////////////////
  void upDataCount({required String productID ,required int count}) async {
    emit(UpDateCountLoading());

    final result =
    await getIt<UpDateCountUseCase>().call(productID, count);

    result.fold(
          (failure) {
       },
          (data) {
        getCart();
      },
    );
  }


}
