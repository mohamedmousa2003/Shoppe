import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import '../../../domain/entities/login_entity.dart';
import '../../../domain/use_cases/login_used_case.dart';
import '../state/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUsedCase loginUseCase;
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());

  final emailController = TextEditingController(text: "Mousa2003123456789@gmail.com",);
  final passwordController = TextEditingController(text: "mousa123456789");

  void login() async {
    emit(LoginLoading());
    final eitherResult = await loginUseCase.call(
        LoginEntity(
            emailController.text, passwordController.text));
    eitherResult.fold(
          (l) => emit(LoginError(l.message)),
          (user) => emit(LoginSuccess(user)),
    );
  }
}


/*
  final emailController = TextEditingController(text: "Mousa2003123456789@gmail.com",);
  final passwordController = TextEditingController(text: "mousa123456789");
 */