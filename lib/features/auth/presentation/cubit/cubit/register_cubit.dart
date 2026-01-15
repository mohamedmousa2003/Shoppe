import 'package:e/features/auth/presentation/cubit/state/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/register_entity.dart';
import '../../../domain/use_cases/register_use_case.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());
  final nameController = TextEditingController(text: "mohamed");
  final emailController = TextEditingController(text: "Mousa2003123456789@gmail.com",);
  final passwordController = TextEditingController(text: "mousa123456789");
  final rePasswordController = TextEditingController(text: "mousa123456789",);
  final phoneController = TextEditingController(text: "01285947399");

  void register() async {

    emit(RegisterLoading());

    final eitherResult = await registerUseCase.call(
      nameController.text,
      emailController.text,
      passwordController.text,
      rePasswordController.text,
      phoneController.text,
    );

    eitherResult.fold(
      (failure) => emit(RegisterError(failure.message)),
      (user) => emit(RegisterSuccess(user)),
    );

  }
}
