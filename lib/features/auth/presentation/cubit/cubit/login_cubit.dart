import 'package:injectable/injectable.dart';

import '../../../domain/entities/login_entity.dart';
import '../../../domain/use_cases/login_used_case.dart';

import 'package:bloc/bloc.dart';

import '../state/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUsedCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitial());

  void login(String email, String password) async {
    emit(LoginLoading());
    final eitherResult = await loginUseCase.call(LoginEntity(email, password));
    eitherResult.fold(
          (l) => emit(LoginError(l.message)),
          (user) => emit(LoginSuccess(user)),
    );
  }
}
