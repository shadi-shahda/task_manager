import 'package:flutter_application_1/core/global_variable/global_variables.dart';
import 'package:flutter_application_1/data/repository/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  bool obscurePassword = true;
  IconData passwordIcon = Icons.visibility;


  obscureLoginPasswordIcon() {
    passwordIcon = passwordIcon == Icons.visibility
        ? Icons.visibility_off
        : Icons.visibility;
  }

  showLoginPassword() {
    obscureLoginPasswordIcon();
    obscurePassword = !obscurePassword;
  }

  login(String username, String password) async {
    emit(LoadingState());
    final res = await authRepo.login(username, password);
    if(token.isNotEmpty) {
      emit(LoadedState());
    }else{
      emit(ErrorState(res.errorMessage));
    }
  }
}
