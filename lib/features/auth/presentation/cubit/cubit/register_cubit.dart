import 'package:e/features/auth/presentation/cubit/state/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/register_entity.dart';
import '../../../domain/use_cases/register_use_case.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  void register(RegisterEntity entity) async {
    emit(RegisterLoading());

    final eitherResult = await registerUseCase(entity);

    eitherResult.fold(
          (failure) => emit(RegisterError(failure.message)),
          (user) => emit(RegisterSuccess(user)),
    );
  }
}
